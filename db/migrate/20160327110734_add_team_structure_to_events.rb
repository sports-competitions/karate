class AddTeamStructureToEvents < ActiveRecord::Migration
  def change
    add_column :events, :team_structure, :json, default: '[]'
  end
end
