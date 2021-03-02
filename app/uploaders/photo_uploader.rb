class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process resize_to_limit: [600, 500]
  
  def size_range
  0..2.megabytes
  end
  
   process :convert => 'jpg' # 画像の保存形式
   process :quality => 'auto'
   process :tags => ['article_photo'] # 保存時に添付されるタグ（管理しやすいように適宜変更しましょう）


 version :thumb do
   process resize_to_limit: [450, 500]
 end
 
   version :tiny do
    cloudinary_transformation :transformation => [
        {:width => 450, :height => 500, :crop => "limit"}]
    process resize_to_fill: [120, 120]
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
