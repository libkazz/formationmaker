class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  process resize_to_fill: [200, 200]
  process convert: 'png'

  version :small do
    process resize_to_fit: [80, 80]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    super.chomp(File.extname(super)) + '.png' if original_filename
  end
end
