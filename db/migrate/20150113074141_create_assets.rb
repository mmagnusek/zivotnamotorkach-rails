class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title
      t.belongs_to :trip, index: true

      t.timestamps null: false
    end

    add_attachment  :assets, :file
  end
end
