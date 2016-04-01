class Team < ActiveRecord::Base
  belongs_to :combat
  has_and_belongs_to_many :people

  validates_uniqueness_of :number
end
