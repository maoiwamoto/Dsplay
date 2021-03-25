class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

process :convert => 'jpg' # 画像の保存形式  
process :quality => 'auto:eco'
process :tags => ['article_photo']
cloudinary_transformation :transformation => [
        {:width => 600, :height => 600, :crop => "limit"}]
  
  def size_range
  0..3.megabytes
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
  
  if Rails.env.development? || Rails.env.test? 
     def  public_id
       return "test/article/" + model.id.to_s
     end
  else
     def  public_id
     return "article/" + model.id.to_s
     end
  end
 
end
