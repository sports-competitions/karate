class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum sex: [ :male, :female ]
  enum role: [ :admin, :moderator, :user ]

  validates_presence_of :name, :email, :birthday
end
