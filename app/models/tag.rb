class Tag < ActiveRecord::Base
  include Translit

  attr_accessible :name

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug
  
  has_many :posts, :through => :taggings
  has_many :taggings, :dependent => :destroy

  before_validation :generate_slug

  def generate_slug
    self.slug = translit(name)
  end

  def to_param
    slug
  end

  def self.find(input)
    find_by_slug(input) || super
  end
end
