class Restaurant < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader 
end
