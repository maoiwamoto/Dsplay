class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

process :convert => 'jpg' # 画像の保存形式  
process :quality => 'auto'
process :tags => ['article_photo']
cloudinary_transformation :transformation => [
        {:width => 600, :height => 500, :crop => "limit"}]
  
  def size_range
  0..2.megabytes
  end


 version :thumb do
   cloudinary_transformation :transformation => [
        {:width => 450, :height => 450, :crop => "fill", :gravity => "auto"}]
 end
 
   version :tiny do
    cloudinary_transformation :transformation => [
        {:width => 120, :height => 120, :crop => "fill", :gravity => "auto"}]
  end
  
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
  
  def  public_id 
  return model.id
  end 
 
end
