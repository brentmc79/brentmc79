class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  validates_presence_of :query

  attr_accessor :query, :results

  def initialize(attributes={})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def results(page=1, per_page=5)
    @results ||= Post.search(query).order("created_at desc").paginate(:per_page => per_page, :page => page)
  end

  def persisted?
    false
  end
end
