class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [700, 600]

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


 version :thumb do
   process resize_to_limit: [450, 450]
 end
 
   version :tiny do
    process resize_to_fill: [120, 120]
  end
 
end
