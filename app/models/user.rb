class User < ActiveRecord::Base
  enum sex: [ :male, :female ]
  enum role: [ :admin, :moderator, :user ]

  validates_presence_of :name, :email, :birthday
end
