class AvatorUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  
process :convert => 'jpg' # 画像の保存形式  
process :quality => 'auto'
process :tags => ['user_avatar']
cloudinary_transformation :transformation => [
{:width => 120, :height => 120, :crop => "fill", :gravity => "auto"}]
  
  def size_range
  0..3.megabytes
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

  
  if Rails.env.development? || Rails.env.test? 
     def  public_id
       return "test/avatar/" + model.user_id.to_s
     end
  else
     def  public_id 
     return "avatar/" + model.user_id.to_s
     end
  end

end
