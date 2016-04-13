class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.references :registrator, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
