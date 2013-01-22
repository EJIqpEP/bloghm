class AddMetaDescToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :meta_desc, :text
  end
end
