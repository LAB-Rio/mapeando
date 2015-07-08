class District < ActiveRecord::Base
  
  has_many :users

  default_scope -> { order('name ASC') }
end
