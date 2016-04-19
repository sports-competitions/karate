class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.string :start_date
      t.string :end_date
      t.text :details

      t.timestamps null: false
    end
  end
end
