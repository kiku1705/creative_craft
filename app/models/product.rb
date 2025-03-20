class Product < ApplicationRecord
  validates :title, :description, presence: true
  has_many :reviews
  scope :active_products, -> (category_id) { joins("INNER JOIN reviews on reviews.product_id = products.id").where(products: {active:true, category_id: category_id}) }
end