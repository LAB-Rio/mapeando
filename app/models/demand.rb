# Fields:
#
# user_id: foreign key
# category_id: foreign key

class Demand < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
 
  has_many :pins
  
  has_and_belongs_to_many :likes, class_name: User, join_table: :demands_users 

  default_scope { order('id DESC') }

  scope :by_category_id,  ->(int) { where(category_id: int) }
  scope :skip_fullname,   -> { where("demands.fullname <> '' ") }


  validates :user, :category, presence: true

  accepts_nested_attributes_for :pins, reject_if: :all_blank
end
