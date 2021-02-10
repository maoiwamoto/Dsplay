class Post < ApplicationRecord
  belongs_to :tag, optional: true
end
