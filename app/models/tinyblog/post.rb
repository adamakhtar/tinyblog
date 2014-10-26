module Tinyblog
  class Post < ActiveRecord::Base
    acts_as_paranoid    
    include ::ActionView::Helpers::TextHelper

    belongs_to :author

    validates :title,   presence: true
    validates :body,    length: {minimum: 0, allow_nil: false}
    validates :author,  presence:  { message: 'must be present.'}

    scope :latest, -> { order('created_at DESC') }

    before_save :update_published_at
    before_validation :ensure_title_and_body


    extend FriendlyId
    friendly_id :title, use: [:history, :slugged, :finders]

    include Workflow
    workflow do
      state :drafting do
        event :publish, :transitions_to => :published
      end
      state :published do
        event :draft, :transitions_to => :drafting
      end
    end

    #
    # Short preview of post's body for use in the index.
    #
    def preview
      truncate(body, length: Tinyblog.post_preview_length, separator: "\n")
    end

    def view!
      self.increment!(:view_count)
    end

    def should_generate_new_friendly_id?
      title_changed?
    end

    private 
    #
    # Callback
    #
    def update_published_at
      if published_at.nil?
        self.published_at = Time.now
      end
    end

    def ensure_title_and_body
      self.title ||= "Untitled"
      self.body  ||= ""
    end

  end
end
