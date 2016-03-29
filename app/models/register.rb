class Register < ActiveRecord::Base
  belongs_to :registrator
  belongs_to :event

  validates :name, presence: true
end
