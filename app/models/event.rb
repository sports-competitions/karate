class Event < ActiveRecord::Base
  validates_presence_of :name , :address, :start_date, :end_date
end
