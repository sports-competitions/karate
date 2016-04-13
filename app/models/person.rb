class Person < ActiveRecord::Base
  belongs_to :registrator
  has_and_belongs_to_many :registers
  has_and_belongs_to_many :combats
  has_and_belongs_to_many :teams

  KINDS = %w(sportsman judge representer)

  validates_presence_of :first_name, :middle_name, :last_name, :birthday, :sex, :kind
  validates :sex, inclusion: { in: %w(male female), message: "%{value} not allowed" }

  def sportsman?
    self.kind == "sportsman"
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

end
