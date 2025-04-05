# create_table "categories", force: :cascade do |t|
#   t.string "name"
#   t.string "description"
#   t.integer "products_count", default: 0
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

class Category < ApplicationRecord
  validates :name, :description, presence: true
  validates :name, length: {minimum: 3, maximum: 30}
  has_one_attached :image 
  has_many :products, counter_cache: true
end