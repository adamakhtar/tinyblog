require_dependency "tinyblog/application_controller"

module Tinyblog
  module Admin
    class PicturesController < BaseController

      def create
        @picture = Picture.new(:data => params[:file])

        if @picture.save
          render :json => { :filename => @picture.url }
        else
          render :nothing => true
        end
      end
    end
  end
end
