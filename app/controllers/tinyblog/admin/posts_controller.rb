require_dependency "tinyblog/application_controller"

module Tinyblog
  module Admin
    class PostsController < BaseController
      
      respond_to :html

      def index
        params[:tab] ||= 'All'
        @posts = case params[:tab]
        when 'All'    then Post.all
        when 'Draft' then Post.with_drafting_state
        when 'Published' then Post.with_published_state
        when 'Trash' then Post.only_deleted
        end
      end

      def show
        @post = Post.find(params[:id])
      end

      def new
        @post = Post.new
      end

      def create
        @post = Post.create(author: Author.first)
        if @post.valid?
          redirect_to edit_admin_editor_path(@post)
        else
          flash[:warning] = t('tinyblog.posts.not_created')
          redirect_to admin_posts_path
        end
      end

      def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
          flash[:notice] = t('tinyblog.posts.updated')
        else
          flash[:warning] = t('tinyblog.posts.not_updated')
        end

        respond_with @post, :location => admin_post_path(@post)
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
          params.require(:post).permit(:author_id, :meta_description, :"published_at(1i)", :"published_at(2i)", :"published_at(3i)")
        end
    end
  end
end
