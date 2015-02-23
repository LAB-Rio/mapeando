# Fields
#
# first_name string
# last_name string
# address_district string

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, omniauth_providers: [:facebook]
  
  has_many :demands
  validates :first_name, :last_name, :address_district, presence: true
end
