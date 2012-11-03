module ApplicationHelper

  def stalker_links
    {"facebook" => "http://facebook.com/brentcollier",
     "github" => "http://github.com/brentmc79",
     "flickr" => "http://flickr.com/brentmc79",
     "foursquare" => "https://foursquare.com/brentmc79",
     "amazon" => "http://amzn.com/w/11UI8DE8EV7NO",
     "linkedin" => "http://www.linkedin.com/in/brentcollier",
     "vimeo" => "http://vimeo.com/brentmc79",
     "twitter" => "http://twitter.com/brentmc79"}
  end

  def tag_links
    @tag_links ||= ActsAsTaggableOn::Tag.all.map do |tag|
      count = ActsAsTaggableOn::Tagging.where(:tag_id => tag.id).count
      {:tag => tag, :count => count}
    end
    @tag_links = @tag_links.sort_by do |tag_link|
      tag_link[:count]
    end.reverse
  end

  def other_posts
    return @other_posts unless @other_posts.nil?
    visible_posts = (@posts || [@post]).map(&:id)
    @other_Posts = Post.where("\"posts\".\"id\" NOT IN (?)",visible_posts).order("created_at desc").all
  end

end
