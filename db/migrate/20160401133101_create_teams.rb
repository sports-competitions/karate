class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :number
      t.references :combat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
