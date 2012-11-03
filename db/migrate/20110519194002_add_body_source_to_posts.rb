class AddBodySourceToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :body_source, :text

    Post.reset_column_information

    Post.all.each do |post|
      post.update_attribute(:body_source, post.body)
    end
  end

  def self.down
    remove_column :posts, :body_source
  end
end
