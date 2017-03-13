class NewFancyBox < ActiveRecord::Migration[5.0]
  def change
    BlogPost.find_each do |post|
      post.body.gsub!('data-fancybox-group="thumb"', 'data-fancybox="gallery"')
      post.save
    end
  end
end
