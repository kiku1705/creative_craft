class Product < ApplicationRecord
  validates :title, :description, presence: true
  validates :price, numericality: { greater_than: 0.0, message: "must be greater than 0" }
  validate :image_size_and_type
  validates :stock_quantity, numericality: { greater_than_or_equal_to: 0 }
  
  belongs_to :category

  has_many :reviews
  has_many_attached :images

  scope :available, -> { where("stock_quantity > 0") }
  scope :under_price, ->(price) {where("price <= ?", price )}

  private
  # validate supported image types and size
  def image_size_and_type
    images.each do |image|
      if image.blob.byte_size > 1.megabyte
        errors.add(:images, "max image size supported is 1 MB")
      end
      if !image.content_type.in?(%('image/jpeg image/png image/gif'))
        errors.add(:images, "must be a JPEG, PNG, or GIF")
      end
    end
  end
end