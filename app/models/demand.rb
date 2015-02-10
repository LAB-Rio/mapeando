# Fields:
#
# user_id: foreign key
# category_id: foreign key

class Demand < ActiveRecord::Base

  belongs_to :user
  
end
