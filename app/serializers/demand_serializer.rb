class DemandSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :user, :user_id, :category, :category_id
 
  has_one :user
  has_one :category
  has_many :pins



  def user
    object.user.first_name
  end

  def category
    object.category.name
  end
end
