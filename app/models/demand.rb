# Fields:
#
# user_id: foreign key
# category_id: foreign key

class Demand < ActiveRecord::Base

  belongs_to :user
  

  


  def self.unique
    self.select('distinct on(fullname) *, (
                SELECT COUNT(*) 
                FROM demands s2 
                WHERE s2.fullname = demands.fullname) 
                as insertions').order(:fullname)
  end

end
