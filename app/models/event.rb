class Event < ActiveRecord::Base
  has_many :combats

  validates_presence_of :name , :address, :start_date, :end_date
end
