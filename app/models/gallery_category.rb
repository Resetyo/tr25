class GalleryCategory < ActiveRecord::Base
  resourcify
  has_many :galleries, foreign_key: :category_id, dependent: :destroy
  accepts_nested_attributes_for :galleries, allow_destroy: true
end
