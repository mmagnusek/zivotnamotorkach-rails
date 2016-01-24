class CreatePostcards < ActiveRecord::Migration
  def change
    create_table :postcards do |t|
      t.string   :name, null: false
      t.string   :street
      t.string   :city
      t.string   :zip_code
      t.datetime :sent_at
      t.timestamps null: false
    end
  end
end
