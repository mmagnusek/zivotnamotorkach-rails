class BloggerIntegration < ActiveRecord::Migration
  def change
    add_column :trips,      :label,      :string
    add_column :blog_posts, :etag,       :string
    add_column :blog_posts, :blogger_id, :string
    add_column :blog_posts, :location,   :text
  end
end
