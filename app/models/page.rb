class Page < ApplicationRecord
  validates :title, :content, :permalink, presence: true
  validates :permalink, uniqueness: true
end
