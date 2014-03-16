require_dependency "tinyblog/application_controller"

module Tinyblog
  module Admin
    class AuthorsController < ApplicationController
      
      respond_to :html
      
      def index
        @authors = Author.all
        respond_with @authors
      end

      def new
      end

      def create
      end

      def edit
      end

      def update
      end

      def destroy
      end
    end
  end
end
