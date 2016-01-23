class Student < User
  has_and_belongs_to_many :trainers,
                          join_table: 'students_trainers'

  default_scope { where student: true }
end
