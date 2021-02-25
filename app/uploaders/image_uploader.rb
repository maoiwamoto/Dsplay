class ImageUploader < CarrierWave::Uploader::Base
  #include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave
  
  def size_range
  0..2.megabytes
  end

  # Choose what kind of storage to use for this uploader:
  #storage :file
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


  # Create different versions of your uploaded files:
 version :thumb do
  process resize_to_limit: [400, 900]
 end
 
  version :tiny do
    process resize_to_fill: [120, 120]
  end
  
  def crop
    if model.crop_x.present?
      resize_to_limit(400, 900)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        # [[w, h].join('x'),[x, y].join('+')].join('+') => "wxh+x+y"
        img.crop([[w, h].join('x'),[x, y].join('+')].join('+'))
      end
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
  %w(jpg jpeg png)
  end
  

end
