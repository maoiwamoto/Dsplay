class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  
  def size_range
  0..2.megabytes
  end
  
  process :convert => 'jpg' # 画像の保存形式
  process :quality => 'auto:eco'
  process :tags => ['post_image'] # 保存時に添付されるタグ（管理しやすいように適宜変更しましょう）
  cloudinary_transformation :transformation => [
        {:width => 800, :height => 1200, :crop => "limit"}]

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
      cloudinary_transformation :transformation => [
        {:width => 450, :height => 800, :crop => "limit"}]
 end
 
  version :tiny do
    cloudinary_transformation :transformation => [
        {:width => 450, :height => 800, :crop => "limit"}]
    process :custom_crop
  end
  
  version :safe do
        cloudinary_transformation :transformation => [
        {:width => 120, :height => 120, :crop => "fill", :gravity => "auto"}]
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
  
  if Rails.env.development? || Rails.env.test? 
     def  public_id
       return "test/post/" + (0...8).map{ ('A'..'Z').to_a[rand(26)] }.join.to_s
     end
  else
    def public_id
    end
  end
  
end