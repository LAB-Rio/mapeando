class Pin < ActiveRecord::Base
  belongs_to :demand


  delegate :category, to: :demand
  delegate :user, to: :demand




  def as_json(options={})
    {
      lat: self.lat,
      long: self.long,
      created_at: self.created_at.strftime('%d-%m-%Y %H:%M'),
      updated_at: self.updated_at.strftime('%d-%m-%Y %H:%M'),
    }.merge(options)
    
  end
end
