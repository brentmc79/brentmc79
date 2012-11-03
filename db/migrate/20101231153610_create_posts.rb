class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text :body
      t.string :title
      t.string :slug
      t.text :meta_description
      t.string :meta_keywords
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
