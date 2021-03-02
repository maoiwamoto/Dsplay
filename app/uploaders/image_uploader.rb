class ImageUploader < CarrierWave::Uploader::Base
  #include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave
  
  def size_range
  0..2.megabytes
  end
  
  process :convert => 'jpg' # 画像の保存形式
  process :quality => 'auto'
  process :tags => ['post_image'] # 保存時に添付されるタグ（管理しやすいように適宜変更しましょう）

  # Choose what kind of storage to use for this uploader:
  #storage :file
  # storage :fog
  #after :remove, :delete_empty_upstream_dirs

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  #def store_dir
  #  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  #end
  
    #def delete_empty_upstream_dirs
    #path = ::File.expand_path(store_dir, root)
    #Dir.delete(path) # fails if path not empty dir

    #rescue SystemCallError
    #true # nothing, the dir is not empty
    #end


  # Create different versions of your uploaded files:
 version :thumb do
  process resize_to_limit: [400, 900]
 end
 
  version :tiny do
    cloudinary_transformation :transformation => [
        {:width => 400, :height => 900, :crop => :limit}]
    process :custom_crop
  end
  
  version :safe do
    process resize_to_fill: [120, 120]
  end
  
  def custom_crop
    return :x => model.crop_x, :y => model.crop_y, 
      :width => model.crop_w, :height => model.crop_h, :crop => :crop
  end
  

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
  %w(jpg jpeg png)
  end
  
  def url(*args)
  if cached?
  "/#{cache_path}"
  else
  super
  end
  end
  

end
