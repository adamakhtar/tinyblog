module Tinyblog
  module PostsHelper
    def render_content(content)
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
      markdown = Redcarpet::Markdown.new(renderer, extensions = {})
      markdown.render(content).html_safe
    end
  end
end
