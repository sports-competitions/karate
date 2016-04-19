class RenameRegistratorsToUsers < ActiveRecord::Migration
  def change
    rename_table :registrators, :users
  end
end
