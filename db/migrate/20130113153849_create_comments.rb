class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :content
      t.integer :post_id
      t.string :ip

      t.timestamps
    end
  end
end
