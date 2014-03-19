require_dependency "tinyblog/application_controller"

module Tinyblog
  class PostsController < ApplicationController
    
    respond_to :html

    def index
      @posts = Post.includes(:author).all
    end

    def show
      @post = Post.find(params[:id])
      @author = @post.author
      @latest_posts = Post.select(:title, :id).latest.limit(Tinyblog.max_latest_posts).all if Tinyblog.latest_posts_on
    end
  end
end
