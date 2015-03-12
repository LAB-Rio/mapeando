class DemandSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :user, :category, :category_id
 
  has_one :user
  has_one :category
  has_many :pins


  
  def user 
    { 
      user_id: object.user.id,
      first_name: object.user.first_name,
      avatar: object.user.avatar,
      district: object.user.district.name
    }
  end

  def category
    object.category.name
  end
end
