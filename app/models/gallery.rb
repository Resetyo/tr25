class Gallery < ActiveRecord::Base
  resourcify
  belongs_to :gallery_category
  default_scope -> {order('sort ASC')}

  mount_uploader :image, GalleryUploader

  after_create do
    self.sort = self.id
    self.save
  end
end