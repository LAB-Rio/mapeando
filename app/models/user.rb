# Fields
#
# first_name string
# last_name string
# address_district string

class User < ActiveRecord::Base
  
  has_many :demands
  validates :first_name, :last_name, :address_district, presence: true
end
