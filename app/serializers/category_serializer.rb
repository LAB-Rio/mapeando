class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :travel_mode, :issue, :icon_url, :marker_color, :demands

  has_many :demands
  

  def demands__sql
    '
      (
        SELECT row_to_json(demands)
        FROM (
          SELECT COUNT(*) FROM demands 
          WHERE demands.category_id = categories.id
        ) demands
      )
    ' 
  end
end
