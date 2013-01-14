class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.integer :post_id
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
