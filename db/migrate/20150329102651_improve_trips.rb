class ImproveTrips < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :trip_id
      t.integer :kind, default: 0
      t.string  :title
      t.text    :url
    end

    add_column :trips, :background_image, :integer
  end
end
