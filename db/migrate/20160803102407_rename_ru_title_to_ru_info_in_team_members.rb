class RenameRuTitleToRuInfoInTeamMembers < ActiveRecord::Migration
  def change
    rename_column :team_members, :ru_title, :ru_info
  end
end
