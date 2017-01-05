class Guide < ApplicationRecord
ratyrate_rateable "language", "attitude", "price"

mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model.
def self.search_name(key)
   where('name like ?', "%#{key}%")
end
def self.search_language(key)
   where('language like ?', "%#{key}%")
end

def image_url
    if image.present?
      image
    else
      "http://loremflickr.com/320/240/#{CGI.escape name}"
    # onchange="readURL(this)
    "#"
    end
  end
end
