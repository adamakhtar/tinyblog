module Tinyblog
  class Post < ActiveRecord::Base
    acts_as_paranoid    
    include ::ActionView::Helpers::TextHelper

    belongs_to :author

    validates :title,   presence: true
    validates :author,  presence:  { message: 'must be present.'}

    scope :latest, -> { order('created_at DESC') }

    before_save :update_published_at

    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

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
