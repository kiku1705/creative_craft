class AddRatingContentAutherToReview < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :rating, :integer, null: false
    add_column :reviews, :content, :text
    add_column :reviews, :auther_name, :string
    remove_column :reviews, :review_summary
    remove_column :reviews, :category_id
    remove_column :reviews, :user_id
  end
end
