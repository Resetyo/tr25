class AddColumnsToTeamMembers < ActiveRecord::Migration
  def change
    add_column :team_members, :ru_name, :string
    add_column :team_members, :ru_title, :string
  end
end
