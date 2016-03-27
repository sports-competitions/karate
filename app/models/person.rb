class Person < ActiveRecord::Base
  belongs_to :registrator

  validates_presence_of :first_name, :middle_name, :last_name, :birthday, :sex, :kind
  validates :sex, inclusion: { in: %w(male female), message: '%{value} not allowed' }
end
