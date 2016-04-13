class ChangeDateColumsInEvents < ActiveRecord::Migration
  def up
    change_column :events, :start_date, "date USING start_date::date"
    change_column :events, :end_date, "date USING end_date::date"
  end

  def down
    change_column :events, :start_date, :string
    change_column :events, :end_date, :string
  end
end
