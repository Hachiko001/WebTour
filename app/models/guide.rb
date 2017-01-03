class Guide < ApplicationRecord


def self.search_name(key)
   where('name like ?', "%#{key}%")
end
def self.search_language(key)
   where('language like ?', "%#{key}%")
end

end
