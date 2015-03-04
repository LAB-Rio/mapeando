# Fields:
#
# user_id: foreign key
# category_id: foreign key

class Demand < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
 
  has_many :pins

  validates :user, :category, :fullname, presence: true


end
