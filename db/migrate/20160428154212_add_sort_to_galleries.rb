class AddSortToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :sort, :integer
  end
end
