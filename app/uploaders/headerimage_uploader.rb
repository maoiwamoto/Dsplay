class HeaderimageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  
process :convert => 'jpg' # 画像の保存形式  
process :quality => 'auto:eco'
process :tags => ['user_headerimage']
cloudinary_transformation :transformation => [
        {:width => 800, :height => 300, :crop => "fill_pad", :gravity => "auto", :background  => "auto"}]
  
  def size_range
  0..3.megabytes
  end
  
  def extension_whitelist
  %w(jpg jpeg png)
  end
  
  if Rails.env.development? || Rails.env.test? 
     def  public_id
       return "test/header/" + model.user_id.to_s
     end
  else
     def  public_id 
     return "header/" + model.user_id.to_s
     end
  end
  
  def url(*args)
  if cached?
  "/#{cache_path}"
  else
  super
  end
  end

end
