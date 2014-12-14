class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string    :title,     null: false
      t.string    :slug,      uniq: true
      t.date      :begin_on,  null: false
      t.text      :homepage_body
      t.text      :body
      t.boolean   :display_on_homepage
      t.datetime  :archived_at
      t.timestamps null: false
    end

    add_column :blog_posts, :trip_id, :integer

    add_index :blog_posts, :trip_id
  end
end
