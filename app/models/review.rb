class Review < ApplicationRecord

  validates :content, presence: true
  validates :rating, presence: true, inclusion: {in: 1..5 }
  validates :auther_name, presence: true
  scope :high_ratings, -> { where("rating >= 4") }
  belongs_to :product
end