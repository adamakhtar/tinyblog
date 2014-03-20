module Tinyblog
  class Post < ActiveRecord::Base
    
    include ::ActionView::Helpers::TextHelper

    belongs_to :author

    scope :latest, -> { order('created_at DESC') }

    before_save :update_published_at

    #
    # Short preview of post's body for use in the index.
    #
    def preview
      truncate(body, length: Tinyblog.post_preview_length, separator: "\n")
    end

    #
    # Callback
    #
    def update_published_at
      if published_at.nil?
        self.published_at = Time.now
      end
    end

  end
end
