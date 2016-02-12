class Trainer < User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_and_belongs_to_many :students,
                          join_table: 'students_trainers'

  validates_presence_of :email

  default_scope { where trainer: true }
end
