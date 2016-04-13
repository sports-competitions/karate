class Event < ActiveRecord::Base
  has_many :combats, dependent: :destroy
  has_many :registers, dependent: :destroy

  validates_presence_of :name , :address, :start_date, :end_date
end
