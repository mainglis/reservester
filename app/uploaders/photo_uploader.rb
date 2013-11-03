class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumbnail do
    process :resize_to_fit => [300, 250]
  end

  version :masthead do
    process :resize_to_fit => [600, 500]
  end
end
