class Person < ActiveRecord::Base
  belongs_to :registrator
  has_and_belongs_to_many :registers,
                          join_table: 'people_registers'
  has_and_belongs_to_many :combats,
                          join_table: 'combats_people'
  has_and_belongs_to_many :teams,
                          join_table: 'people_teams'

  validates_presence_of :first_name, :middle_name, :last_name, :birthday, :sex, :kind
  validates :sex, inclusion: { in: %w(male female), message: "%{value} not allowed" }
end
