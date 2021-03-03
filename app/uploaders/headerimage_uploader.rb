class HeaderimageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  
process :convert => 'jpg' # 画像の保存形式  
process :quality => 'auto'
process :tags => ['user_headerimage']
cloudinary_transformation :transformation => [
        {:width => 700, :height => 450, :crop => "limit"}]
  
  def size_range
  0..2.megabytes
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
  return "header/" + model.user_id.to_s
  end 

end
