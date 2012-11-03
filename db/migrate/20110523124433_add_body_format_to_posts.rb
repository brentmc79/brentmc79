class AddBodyFormatToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :body_format, :string

    Post.reset_column_information

    Post.all.each do |p|
      p.body_format = "html"
      p.save
    end
  end

  def self.down
    remove_column :posts, :body_format
  end
end
