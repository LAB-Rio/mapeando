require 'csv'

namespace :postgis do
  desc "Export demand by Districts (and zones) of the city"


  task demand_aps: :environment do
    
  # Querying for demands nearest districts pins (based on angular calculation, must be 5% to 8% deviated)
  # returns a list of districts with demands count
  query = ActiveRecord::Base.connection.select_all %Q{
    SELECT 
      d.id, 
      d.name, 
      d.zone, 
      (
        SELECT COUNT(DISTINCT(p0.demand_id))
        FROM pins p0
        WHERE 
          ST_Intersects(
            d.geo, 
            ST_MakePoint(p0.long::numeric, p0.lat::numeric)
          )
        AND p0.created_at <= '2015-05-31'::timestamp
      )
    FROM districts d
    GROUP BY d.id
    
   }
    #lat: "-22.95334", long: "-43.19"
   puts query
   CSV.open(Rails.root.join("db/sampledata/export_districts_#{Date.today}.csv"), 'wb') do |csv|
     csv << ["id", "name", "ap", "count"]
      query.each do |q|
        csv << [q["id"], q["name"], q["zone"], q["count"]]
      end
   end
  end

  task category_aps: :environment do
    query_function = ActiveRecord::Base.connection.execute %Q{
      DROP FUNCTION IF EXISTS get_category_zone(integer, text);

      CREATE OR REPLACE FUNCTION get_category_zone(cat_id integer, zone_id text) RETURNS numeric AS $$
        SELECT SUM(zone_list.count) FROM (
          SELECT 
            d.id,
            d.zone,
            (
              SELECT COUNT(*)
              FROM pins p0
              JOIN demands d0 ON p0.demand_id = d0.id
              WHERE ST_Intersects(
                d.geo,
                ST_MakePoint(p0.long::numeric, p0.lat::numeric)
              )
              AND d0.category_id = cat_id
              AND d0.created_at <= '2015-05-31'::timestamp
            )
          FROM districts d
        ) as zone_list
        WHERE zone_list.zone = zone_id
      $$ LANGUAGE SQL;
    }
    query = ActiveRecord::Base.connection.select_all %Q{
      SELECT 
        c0.id,
        c0.name,
        (
          SELECT count(*) from demands d1 where d1.category_id = c0.id 
          AND d1.created_at <= '2015-05-31'::timestamp
          AND (SELECT count(*) from pins p1 WHERE p1.demand_id = d1.id AND p1.lat <> '') > 0
        ), 
        get_category_zone(c0.id, 'AP1') as AP1,
        get_category_zone(c0.id, 'AP2') as AP2,
        get_category_zone(c0.id, 'AP3') as AP3,
        get_category_zone(c0.id, 'AP4') as AP4,
        get_category_zone(c0.id, 'AP5') as AP5
      FROM categories c0
      GROUP BY 1
     }

     puts query_function.inspect
     puts query
     CSV.open(Rails.root.join("db/sampledata/export_category_#{Date.today}.csv"), 'wb') do |csv|
       csv << ["id", "name", "count", "ap1", "ap2", "ap3", "ap4", "ap5"]
        query.each do |q|
          csv << [q["id"], q["name"], q["count"], q["ap1"], q["ap2"],q["ap3"],q["ap4"],q["ap5"]]
        end
     end
  end


  task demand_ids: :environment do 


    query = ActiveRecord::Base.connection.execute %Q{
      SELECT 
        id,
        (select count(*) from pins p1 where p1.demand_id = d0.id) as pins_count,
        (
          SELECT row_to_json(t) FROM
            (
              SELECT 
              (
                SELECT DISTINCT ON(p0.demand_id)
                  p0.demand_id
                FROM pins p0
                WHERE ST_Intersects(
                  d.geo,
                  ST_MakePoint(p0.long::numeric, p0.lat::numeric)
                ) is false
              ) idss
            FROM districts d
          ) t
      ) as row

      FROM demands d0
    }
    
    puts query

  end
end

