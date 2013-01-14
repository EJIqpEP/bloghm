class Comment < ActiveRecord::Base
  attr_accessible :content, :email, :ip, :name, :post_id
  belongs_to :post

  validates_presence_of :content, :email, :post_id
end
