class Combat < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :people,
                          join_table: 'combats_people'

  validates_presence_of :name, :min_rank, :start_age, :end_age, :start_weight, :end_weight, :sex
  validates :sex, inclusion: { in: %w(male female), message: "%{value} not allowed" }
end
