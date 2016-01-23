class Trainer < User
  has_and_belongs_to_many :students,
                          join_table: 'students_trainers'

  default_scope { where trainer: true }
end
