class CreateCombatsPeople < ActiveRecord::Migration
  def change
    create_table :combats_people do |t|
      t.integer :person_id
      t.integer :combat_id
    end

    add_index :combats_people, :person_id
    add_index :combats_people, :combat_id
  end
end
