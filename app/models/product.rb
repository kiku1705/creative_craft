class Product < ApplicationRecord
  validates :title, :description, presence: true
  scope :active_products, -> { where(active:true) }
end