class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum sex: [ :male, :female ]
  enum role: [ :admin, :moderator, :user ]

  validates_presence_of :email

  after_create :default_role

  private
  def default_role
    self.role ||= 'user'
  end

end
