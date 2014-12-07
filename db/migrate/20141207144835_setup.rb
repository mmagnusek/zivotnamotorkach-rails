class Setup < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string  :title, null: false
      t.string  :slug,  null: false
      t.text    :body
      t.timestamps
    end

    add_index :blog_posts, :slug
  end
end
