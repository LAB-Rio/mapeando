namespace :postgis do
  desc "Export demand by APs (zones) of the city"
  task demand_aps: :environment do
    
  # QUerying for Botafogo nearest
   query = ActiveRecord::Base.connection.select_all %Q{
    SELECT d.zone, COUNT(*)
    FROM districts d
    GROUP BY d.zone
   }

   puts query
  end

end



# %Q{
    #SELECT lat, long, fullname FROM pins p 
    #WHERE ST_Distance(
      #ST_MakePoint(-22.95334,-43.19)::geometry,
      #ST_MakePoint(p.lat::numeric, p.long::numeric)::geometry
      #) < 0.010 
   #}



