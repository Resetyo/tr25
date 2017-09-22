class AddRucolumnsToGalleryCategories < ActiveRecord::Migration
  def change
    add_column :gallery_categories, :ru_title, :string
    add_column :gallery_categories, :ru_subtitle, :string
  end
end
