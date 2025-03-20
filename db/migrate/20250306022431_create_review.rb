class CreateReview < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :review_summary
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
