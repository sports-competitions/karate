class CreateStudentsTrainersJoinTable < ActiveRecord::Migration
  def change
    create_table :students_trainers, id: false do |t|
      t.integer :student_id
      t.integer :trainer_id
    end

    add_index :students_trainers, :student_id
    add_index :students_trainers, :trainer_id
  end
end
