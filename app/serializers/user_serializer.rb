class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :district, :avatar

  has_many :demands


  def name
    object.first_name + object.last_name
  end

  def district
    object.district.name
  end
end
