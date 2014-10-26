module Tinyblog
  module PostsHelper
    def render_content(content)
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
      markdown = Redcarpet::Markdown.new(renderer, extensions = {})
      markdown.render(content).html_safe
    end

    def cache_key_for_posts
      count          = Post.count
      max_updated_at = Post.maximum(:updated_at).try(:utc).try(:to_s, :number)
      "posts/all-#{count}-#{max_updated_at}"
    end
  end
end
