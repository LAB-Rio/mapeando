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
        WHERE ST_Distance(
          ST_MakePoint(d.lat::numeric, d.long::numeric)::geometry,
          ST_MakePoint(p0.lat::numeric, p0.long::numeric)::geometry
        ) < 0.009
      )
    FROM districts d
    ORDER BY id ASC
   }

   puts query
   CSV.open(Rails.root.join("db/sampledata/export_districts_#{Date.today}.csv"), 'wb') do |csv|
     csv << ["id", "name", "ap", "count"]
      query.each do |q|
        csv << [q["id"], q["name"], q["zone"], q["count"]]
      end
   end
  end

  task category_aps: :environment do
    query = ActiveRecord::Base.connection.select_all %Q{
      SELECT 
        c.id, 
        d.name,  
        (
          SELECT COUNT(DISTINCT(p0.demand_id))
          FROM pins p0
          WHERE ST_Distance(
            ST_MakePoint(d.lat::numeric, d.long::numeric)::geometry,
            ST_MakePoint(p0.lat::numeric, p0.long::numeric)::geometry
          ) < 0.009
        )
      FROM districts d
      ORDER BY id ASC
     }

     puts query
     CSV.open(Rails.root.join("db/sampledata/export_districts_#{Date.today}.csv"), 'wb') do |csv|
       csv << ["id", "name", "ap", "count"]
        query.each do |q|
          csv << [q["id"], q["name"], q["zone"], q["count"]]
        end
     end



  end



end



# %Q{
    #SELECT lat, long, fullname FROM pins p 
    #WHERE ST_Distance(
      #ST_MakePoint(-22.95334,-43.19)::geometry,
      #ST_MakePoint(p.lat::numeric, p.long::numeric)::geometry
      #) < 0.010 
   #}



