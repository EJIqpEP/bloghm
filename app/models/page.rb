class Page < ActiveRecord::Base
  include Translit

  attr_accessible :content, :published, :published_at, :title

  validates_presence_of :title, :content
  validates_uniqueness_of :title

  #scopes
  scope :published, lambda { where('published IS TRUE AND published_at <= ?', Time.zone.now)  }

  #slug
  before_validation :generate_slug

  def generate_slug
    self.slug = translit(title)
  end

  attr_protected :slug

  def to_param
    slug
  end

  def self.find(input)
    find_by_slug!(input) || super
  end


end
