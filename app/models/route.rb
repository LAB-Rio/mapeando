class Route < ActiveRecord::Base

  

  


  def self.unique
    self.select('distinct on(fullname) *, (
                SELECT COUNT(*) 
                FROM routes s2 
                WHERE s2.fullname = routes.fullname) 
                as insertions').order(:fullname)
  end

end
