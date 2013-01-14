# encoding: UTF-8
class Post < ActiveRecord::Base
  include Translit

  attr_accessible :body, :published, :published_at, :title

  has_many :paintings, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :tags, :through => :taggings
  has_many :taggings, :dependent => :destroy

  validates_presence_of :title, :body, :slug
  #validates_uniqueness_of :title, :slug

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
    find_by_slug(input) || super
  end

  # tags
  after_save :assign_tags
  attr_writer :tag_names

  def tag_names
    @tag_names || tags.map(&:name).join(', ')
  end

  private
    
    def assign_tags
      if @tag_names
        self.tags = @tag_names.split(/,\s*/).map do |name|
          Tag.find_or_create_by_name(name)
        end
      end
    end
end
