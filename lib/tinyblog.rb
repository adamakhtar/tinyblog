require "tinyblog/engine"

module Tinyblog
  mattr_accessor :disqus_shortname, 
                 :twitter_username, 
                 :social_buttons_on,
                 :post_preview_length


  class << self
    def post_preview_length
      @@post_preview_length || 400
    end
  end

end
