class AddProductIdInReview < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :product
  end
end
