require_dependency "tinyblog/application_controller"

module Tinyblog
  class PostsController < ApplicationController
    
    respond_to :html, :rss

    def index
      @posts = Post.with_published_state.includes(:author).all
      @latest_posts = Post.with_published_state.latest.limit(Tinyblog.max_latest_posts).all if Tinyblog.latest_posts_on
      respond_with @posts
    end

    def show
      @post = if tinyblog_admin_logged_in? 
        Post.find(params[:id])
      else
        Post.with_published_state.find(params[:id])
      end

      @author = @post.author
      @latest_posts = Post.with_published_state.latest.limit(Tinyblog.max_latest_posts).all if Tinyblog.latest_posts_on
    end
  end
end
