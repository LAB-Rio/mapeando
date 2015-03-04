class UserSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :demands


  def name
    object.first_name + object.last_name
  end
end
