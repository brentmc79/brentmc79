class Post < ActiveRecord::Base

  attr_accessible :published, :title, :slug, :meta_description, :meta_keywords, :body_source

  BODY_FORMATS = %w{markdown html}

  acts_as_taggable

  before_save :parse_markdown

  def to_param
    slug
  end

  private

    def parse_markdown
      self.body = if(body_format == "markdown")
        RDiscount.new(body_source).to_html
      elsif body_format == "html"
        body_source
      end
    end

end
