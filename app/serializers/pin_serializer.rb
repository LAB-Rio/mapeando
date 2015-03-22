class PinSerializer < ActiveModel::Serializer
  attributes :id, :lat, :long, :fullname, :icon
  has_one :demand
  has_one :category
  has_one :user

  def icon
    object.demand.category.icon_url
  end
end
