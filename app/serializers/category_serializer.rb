class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :travel_mode, :issue, :icon_url
end
