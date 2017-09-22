class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :info
      t.string :photo
      t.string :fb
      t.string :vk
      t.integer :status
      t.integer :sort

      t.timestamps null: false
    end
  end
end
