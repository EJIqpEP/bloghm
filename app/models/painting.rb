class Painting < ActiveRecord::Base
  attr_accessible :post_id, :image, :name
  belongs_to :post
  mount_uploader :image, ImageUploader
end
