class RenameRegistratorIdToUserId < ActiveRecord::Migration
  def change
    rename_column :people, :registrator_id, :user_id
    rename_column :registers, :registrator_id, :user_id
  end
end
