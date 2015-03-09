class PinSerializer < ActiveModel::Serializer
  attributes :id, :lat, :long, :fullname, :icon


  def icon
    object.demand.category.icon_url
  end
end
