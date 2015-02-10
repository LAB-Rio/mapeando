class Category < ActiveRecord::Base

  has_many :demands
  has_many :users, through: :demands



end
