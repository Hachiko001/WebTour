class Guide < ApplicationRecord
has_many :order_guides
default_scope { where(active: true) }

ratyrate_rateable "language", "attitude", "price"

has_many :comments

def self.search_name(key)
   where('name like ?', "%#{key}%")
end
def self.search_language(key)
   where('language like ?', "%#{key}%")
end


  def self.name_order
    order(:name)
  end

  def self.price_order
    order(price: :desc)
  end

mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model.

def image_url
    if image.present?
      image
    else
      "http://loremflickr.com/320/240/#{CGI.escape name}"
    end
  end
end
