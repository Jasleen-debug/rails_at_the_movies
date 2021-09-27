class ProductionCompany < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
