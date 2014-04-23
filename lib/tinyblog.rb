require "tinyblog/engine"

module Tinyblog
  mattr_accessor :blog_name,
                 :blog_description,
                 :blog_name_links_to,
                 :disqus_shortname, 
                 :twitter_username, 
                 :social_buttons_on,
                 :share_buttons_on,
                 :post_preview_length,
                 :max_latest_posts,
                 :latest_posts_on,
                 :layout,
                 :admin_layout


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

    def admin_layout
      @@admin_layout || 'tinyblog/admin'
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

    def blog_name_links_to
      @@blog_name_links_to ||= '/'
    end
  end

end
