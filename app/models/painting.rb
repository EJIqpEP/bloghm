class Painting < ActiveRecord::Base
  attr_accessible :post_id, :image, :name
  belongs_to :post
  mount_uploader :image, ImageUploader

  before_create :default_name
  before_destroy :remember_id
  after_destroy :delete_files_dir

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end


  private

  def remember_id
    @id = id
  end

  def delete_files_dir
    FileUtils.remove_dir("public/uploads/painting/image/#{@id}", :force => true)  
  end

end
