class HeaderimageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [700, 500]
  
  def size_range
  0..2.megabytes
  end

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog
  after :remove, :delete_empty_upstream_dirs

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
    def delete_empty_upstream_dirs
    path = ::File.expand_path(store_dir, root)
    Dir.delete(path) # fails if path not empty dir

    rescue SystemCallError
    true # nothing, the dir is not empty
    end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def extension_whitelist
  %w(jpg jpeg png)
  end

end
