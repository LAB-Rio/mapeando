class DemandSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :user_id, :category_id, :category, :pins, :user
 

  def category__sql
    '(  
        SELECT row_to_json(cat) 
        FROM ( 
          SELECT name, travel_mode, marker_color, icon_url 
          FROM categories 
          WHERE categories.id = demands.category_id 
        ) cat
      )'
  end


  def pins__sql
    '(  
        SELECT json_agg(row_to_json(p)) 
        FROM (
          SELECT lat, long, fullname FROM pins 
          WHERE pins.demand_id = demands.id
        ) p
      )'
  end


  def user__sql
     '(  
        SELECT row_to_json(usr) 
        FROM ( 
          SELECT 
            first_name, 
            last_name, 
            avatar,
            (SELECT name FROM districts dt WHERE dt.id = u1.district_id) as district
          FROM users u1 
          WHERE u1.id = demands.user_id 
        ) usr
      )'     
  end


end
