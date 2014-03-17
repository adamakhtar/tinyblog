module Tinyblog
  class Picture < ActiveRecord::Base
     mount_uploader :data, TinyblogPictureUploader
  end
end
