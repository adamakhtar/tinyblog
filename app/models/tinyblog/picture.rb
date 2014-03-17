module Tinyblog
  class Picture < ActiveRecord::Base
     mount_uploader :data, TinyblogPictureUploader
     delegate :url, :to => :data
     
  end
end
