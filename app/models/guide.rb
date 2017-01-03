class Guide < ApplicationRecord
<<<<<<< HEAD


def self.search_name(key)
   where('name like ?', "%#{key}%")
end
def self.search_language(key)
   where('language like ?', "%#{key}%")
end

=======
mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model.

def image_url
    if image.present?
      image
    else
    "#"
    end
  end
>>>>>>> origin/master
end
