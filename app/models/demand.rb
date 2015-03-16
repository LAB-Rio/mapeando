# Fields:
#
# user_id: foreign key
# category_id: foreign key

class Demand < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
 
  has_many :pins
  
  scope :by_category_id, ->(id) { where(category_id: id) }


  validates :user, :category, presence: true

  accepts_nested_attributes_for :pins, reject_if: :all_blank
end
