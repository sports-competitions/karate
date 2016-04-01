class Team < ActiveRecord::Base
  belongs_to :combat
  has_and_belongs_to_many :people,
                          join_table: 'people_teams'

  validates_uniqueness_of :number
end
