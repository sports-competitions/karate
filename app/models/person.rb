class Person < ActiveRecord::Base
  belongs_to :registrator
  has_and_belongs_to_many :registers
  has_and_belongs_to_many :combats
  has_and_belongs_to_many :teams

  KIND = [ "sportsman", "judge", "representer" ]

  validates_presence_of :first_name, :middle_name, :last_name, :birthday, :sex, :kind
  validates :sex, inclusion: { in: %w(male female), message: "%{value} not allowed" }
end
