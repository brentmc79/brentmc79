# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Post.delete_all

#posts = YAML.load_file('db/seed_data/posts.yml')
readlines = IO.readlines('db/seed_data/posts.yml')
posts = []
post = nil
body = nil
line_number = 0
readlines.each do |line|
  line_number += 1
  if line.match(/\s\sid:/)
    puts "id"
    post = Post.new
    next
  elsif line.match(/\s\stitle:/)
    puts "title"
    post.title = line.gsub("  title: ","")
  elsif line.match(/^\s\sbody:\s\|-/)
    puts "starting body                 #{line}"
    body = ""
  elsif line.match(/\s\sbody:\s.*/)
    puts "single-line body              #{line[0..20]}"
    body = line.gsub("  body: ","")
  elsif line.match(/\s\sslug:\s/)
    puts "slug"
    post.body = body
    body = nil
    post.slug = line.gsub("  slug: ","")
  elsif body != nil
    puts " - body                       #{line[0..20]}"
    body += line
  elsif line.match(/\s\screated_at:\s/)
    puts "created_at"
    post.created_at = Date.parse(line.gsub("  created_at: ",""))
  elsif line.match(/\s\supdated_at:\s/)
    puts "updated_at"
    post.updated_at = Date.parse(line.gsub("  updated_at: ",""))
  elsif line.match(/\s\spublished:\s/)
    puts "published"
    post.published = line.include?("1")
  elsif line.match(/\s\skeywords:\s/)
    puts "keywords"
    post.meta_keywords = line.gsub("  keywords: ","")
  elsif line.match(/\s\sdescription:\s/)
    puts "description"
    post.meta_description = line.gsub("  description: ","")
  elsif line.match(/^-.*/)
    puts "adding post \"#{post.title}\""
    posts << post
  else
    puts "Unrecognized line #{line_number}: #{line}"
  end
end
puts "Post count: #{posts.size}"
posts.each {|p| p.save }
puts "Posts saved: #{Post.count}"
