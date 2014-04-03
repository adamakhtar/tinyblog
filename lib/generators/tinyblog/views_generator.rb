module Tinyblog
  module Generators
    
    class ViewsGenerator < Rails::Generators::Base #:nodoc:
      source_root File.expand_path("../../../../app/views/tinyblog", __FILE__)
      desc "Used to copy tinyblog's views to your application's views."

      def copy_views
        view_directory :posts
        view_directory :admin
      end

      protected

      def view_directory(name)
        directory name.to_s, "app/views/tinyblog/#{name}"
      end
    end

  end
end
