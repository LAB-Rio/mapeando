class PinSerializer < ActiveModel::Serializer
  attributes :id, :lat, :long, :fullname
end
