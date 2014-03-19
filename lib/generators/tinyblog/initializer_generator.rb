
require 'rails/generators'

module Tinyblog


    class InitializerGenerator < Rails::Generators::Base
      
      source_root File.expand_path('../templates', __FILE__)

      desc "Copies the tinyblog initializer file into config/initializers"
      def copy_initializer_file
        copy_file 'initializer.rb', "config/initializers/tinyblog.rb"
      end

    end


end