class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :avatar

  has_many :demands
  has_one :district
end
