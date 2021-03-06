class Registrator < ActiveRecord::Base

  enum sex: [ :male, :female ]
  enum role: [ :user, :admin ]

  has_many :people
  has_many :registers

  validates_presence_of :first_name, :middle_name, :last_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
