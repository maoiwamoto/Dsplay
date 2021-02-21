class CloudinaryImageUploader < CarrierWave::Uploader::Base
  
    include Cloudinary::CarrierWave

  process :convert => 'png'

  
version :thumb do
  process resize_to_limit: [450, 900]
 end
 
   version :tiny2 do
    process :custom_crop
    process resize_to_fill: [120, 120]
  end
  
    version :tiny do
    process resize_to_fill: [120, 120]
  end
  
 
  def custom_crop
    return :x => model.crop_x, :y => model.crop_y, 
      :width => model.crop_w, :height => model.crop_h, :crop => :crop
  end
  
end
