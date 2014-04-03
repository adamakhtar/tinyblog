xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title Tinyblog.blog_name
    xml.description Tinyblog.blog_description
    xml.link root_url

    for post in @posts
      xml.item do
        xml.title post.title
        if post.body
          xml.description render_content(post.preview)
        else
          xml.description "No content"
        end
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
