require "tinyblog/engine"

module Tinyblog
  mattr_accessor :blog_name,
                 :blog_description,
                 :disqus_shortname, 
                 :twitter_username, 
                 :social_buttons_on,
                 :share_buttons_on,
                 :post_preview_length,
                 :max_latest_posts,
                 :latest_posts_on,
                 :layout


  class << self
    def post_preview_length
      @@post_preview_length || 400
    end

    def max_latest_posts
      @@max_latest_posts || 7
    end

    def latest_posts_on
      max_latest_posts > 0
    end

    def layout
      @@layout || 'tinyblog/default'
    end

    def share_buttons_on 
      @@share_buttons_on || false
    end

    def blog_name
      @@blog_name || 'My Blog'
    end

    def blog_description
      @@blog_description || 'The latest news about me'
    end
  end

end
