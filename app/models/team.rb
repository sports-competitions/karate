class Team < ActiveRecord::Base
  belongs_to :combat

  validates_uniqueness_of :number
end
