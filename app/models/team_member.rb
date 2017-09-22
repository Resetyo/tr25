class TeamMember < ActiveRecord::Base
  resourcify
  mount_uploader :photo, TeamPhotoUploader
end
