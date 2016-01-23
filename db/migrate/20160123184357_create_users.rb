class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :sex, default: 0
      t.date :birthday
      t.integer :weight
      t.integer :role, default: 2
      t.boolean :student, default: false
      t.boolean :trainer, default: false

      t.timestamps null: false
    end
  end
end
