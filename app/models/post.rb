# encoding: UTF-8
class Post < ActiveRecord::Base
  include Translit

  attr_accessible :body, :published, :published_at, :slug, :title

  validates_presence_of :title, :body, :slug
  #validates_uniqueness_of :title, :slug

  before_validation :generate_slug

  def generate_slug
    self.slug = translit(title)
  end


  def to_param
    slug
  end

  def self.find(input)
    find_by_slug(input) || super
  end
end
