require_dependency "tinyblog/application_controller"

module Tinyblog
  class PostsController < ApplicationController
    
    respond_to :html

    def index
      @posts = Post.all
    end

    def show
      @post = Post.find(params[:id])
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

      respond_with @post, :location => posts_path
    end

    def edit
    end

    def update
    end

    def destroy
    end

    protected

      def post_params
        params.require(:post).permit(:title, :body)
      end
  end
end
