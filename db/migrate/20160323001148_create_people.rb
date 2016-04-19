class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.references :registrator, index: true, foreign_key: true
      t.string :first_name, null: false, default: ""
      t.string :middle_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.date :birthday, null: false
      t.string :sex, null: false, default: ""
      t.string :kind, null: false, default: ""
      t.string :kind_data

      t.timestamps null: false
    end
  end
end
