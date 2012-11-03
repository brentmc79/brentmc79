xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Brentmc79.com"
    xml.description "Software development bits and pieces"
    xml.link posts_url

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description post.meta_description
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
