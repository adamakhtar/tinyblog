require_dependency "tinyblog/application_controller"

module Tinyblog
  module Admin
  
    class EditorController < BaseController

      respond_to :html

      layout 'tinyblog/editor'

      def edit
        @post = Post.find(params[:id])
      end


      def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
          flash[:notice] = t('tinyblog.posts.updated')
        else
          flash[:warning] = t('tinyblog.posts.not_updated')
        end
        respond_with @post, :location => edit_admin_editor_path(@post)
      end

      private

      def post_params
        params.require(:post).permit(:title, :body)
      end

    end
  end
end
