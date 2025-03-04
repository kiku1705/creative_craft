class Category < ApplicationRecord
  validates :name, :description, presence: true
  has_many :products, counter_cache: true
end