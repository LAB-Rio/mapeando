class Pin < ActiveRecord::Base
  belongs_to :demand


  delegate :category, to: :demand
  delegate :user, to: :demand

end
