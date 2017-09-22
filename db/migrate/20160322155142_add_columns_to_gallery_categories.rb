class AddColumnsToGalleryCategories < ActiveRecord::Migration
  def change
    add_column :gallery_categories, :title, :string
    add_column :gallery_categories, :subtitle, :string
  end
end
