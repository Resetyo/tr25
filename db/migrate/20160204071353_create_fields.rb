class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :ru
      t.string :en

      t.timestamps null: false
    end
  end
end
