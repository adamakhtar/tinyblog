require "tinyblog/engine"

module Tinyblog
  mattr_accessor :disqus_shortname, 
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
  end

end
