class Sport < ActiveRecord::Base
  has_many :qualifications
  validates :title, presence: true
end
