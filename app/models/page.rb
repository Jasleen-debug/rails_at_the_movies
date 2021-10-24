class Page < ApplicationRecord
  validates :title, :content, :permalink, presence: true
end
