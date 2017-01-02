class Guide < ApplicationRecord
mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model.

def image_url
    if image.present?
      image
    else
    "#"
    end
  end
end
