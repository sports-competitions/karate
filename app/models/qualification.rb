class Qualification < ActiveRecord::Base
  belongs_to :sport
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  # validates :view, presence: true

  enum view: [ :qualification, :rank ]
end
