
require 'rails/generators'

module Tinyblog


    class UploaderGenerator < Rails::Generators::Base
      
      source_root File.expand_path('../templates', __FILE__)

      desc "Copies the tinyblog uploader file into app/uploaders"
      def copy_uploader_file
        copy_file 'uploader.rb', "app/uploaders/tinyblog_picture_uploader.rb"
      end

    end


end