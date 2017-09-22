class Background < ActiveRecord::Base
  resourcify
  mount_uploader :image, BackgroundUploader
  
end
