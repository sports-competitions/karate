class CreateCombats < ActiveRecord::Migration
  def change
    create_table :combats do |t|
      t.refences :event
      t.string :name
      t.integer :min_rank
      t.integer :start_age
      t.integer :end_age
      t.integer :start_weight
      t.integer :end_weight
      t.boolean :team
      t.string :sex

      t.timestamps null: false
    end
  end
end
