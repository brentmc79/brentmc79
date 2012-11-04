module ApplicationHelper

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
    visible_posts = @posts || [@post]
    if visible_posts.any?
      visible_posts = visible_posts.map(&:id)
      @other_posts = Post.where("\"posts\".\"id\" NOT IN (?)",visible_posts).order("created_at desc").all
    else
      @other_posts = Post.order("created_at desc").all
    end
  end

  def search
    @search || Search.new
  end

end
