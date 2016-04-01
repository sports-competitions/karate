class CreatePeopleRegisters < ActiveRecord::Migration
  def change
    create_table :people_registers do |t|
      t.integer :person_id
      t.integer :register_id
    end

    add_index :people_registers, :person_id
    add_index :people_registers, :register_id
  end
end
