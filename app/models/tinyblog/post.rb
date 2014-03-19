module Tinyblog
  class Post < ActiveRecord::Base
    
    include ::ActionView::Helpers::TextHelper

    belongs_to :author

    #
    # Short preview of post's body for use in the index.
    #
    def preview
      truncate(body, length: Tinyblog.post_preview_length, separator: "\n")
    end
  end
end
