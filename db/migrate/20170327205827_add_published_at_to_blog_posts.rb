class AddPublishedAtToBlogPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :published_at, :datetime

    BlogPost.update_all('published_at = created_at')
  end
end
