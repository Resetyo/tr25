class AddImagesToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :image, :string
    add_column :galleries, :comment, :string
    add_column :galleries, :category_id, :integer

  end
end
