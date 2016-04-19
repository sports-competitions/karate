class ChangeTeamStructureDefaultInEvents < ActiveRecord::Migration
  def up
    change_column_default :events, :team_structure, "{}"
  end

  def down
    change_column_default :events, :team_structure, "[]"
  end
end
