class Register < ActiveRecord::Base
  belongs_to :registrator
  belongs_to :event
  has_and_belongs_to_many :people,
                          join_table: 'people_registers'

  validates :name, presence: true
end
