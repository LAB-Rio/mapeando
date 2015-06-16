class AddPostgis < ActiveRecord::Migration
  def change
    execute %Q{
      CREATE EXTENSION postgis;
      CREATE EXTENSION postgis_topology;
      CREATE EXTENSION fuzzystrmatch;
      CREATE EXTENSION postgis_tiger_geocoder;
    }
  end
end
