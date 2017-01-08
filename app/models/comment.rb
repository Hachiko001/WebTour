class Comment < ApplicationRecord
  belongs_to :guide
  belongs_to :user
end
