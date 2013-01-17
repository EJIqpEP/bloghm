# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  after :store, :delete_original_file

  def delete_original_file(new_file)
    File.delete path if version_name.blank?
  end

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_limit => [600, 375]
    process :convert => 'jpg'
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end

  def filename
    if original_filename
      @name ||= "#{Digest::MD5.hexdigest(original_filename)}#{File.extname(original_filename)}"
    end
  end

end
