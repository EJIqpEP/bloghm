class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.boolean :published
      t.datetime :published_at

      t.timestamps
    end
  end
end
