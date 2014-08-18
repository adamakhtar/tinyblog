require_dependency "tinyblog/application_controller"

module Tinyblog
  module Admin
    class PostsController < BaseController
      
      respond_to :html

      def index
        params[:tab] ||= 'All'
        @posts = case params[:tab]
        when 'All' then Post.all
        when 'Trash' then Post.only_deleted
        end
      end

      def new
        @post = Post.new
      end

      def create
        @post = Post.new(post_params)
        if @post.save
          flash[:notice] = t('tinyblog.posts.created')
        else
          flash[:warning] = t('tinyblog.posts.not_created')
        end

        respond_with @post, :location => admin_posts_path
      end

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

        respond_with @post, :location => admin_posts_path
      end

      def destroy
        @post = Post.find(params[:id])
        @post.destroy
        
        flash[:notice] = t('tinyblog.posts.deleted')
        redirect_to admin_posts_path
      end

      def restore
        @post = Post.only_deleted.find(params[:id])
        Post.restore(@post.id)
        flash[:notice] = t('tinyblog.posts.restored')
        redirect_to admin_posts_path
      end

      protected

        def post_params
          params.require(:post).permit(:title, :body, :author_id)
        end
    end
  end
end
