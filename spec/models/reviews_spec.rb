require 'rails_helper'
RSpec.describe Review do
  describe "validations" do
    it "rating should be in 1 to 5" do
      review = build(:review, rating: 6)
      review.valid?
      expect(review.errors["rating"]).to include("is not included in the list")
      review.rating = 3
      expect(review.valid?).to be_truthy
    end

    it "auther_name should be present" do
      review = build(:review, auther_name: "")
      review.valid?
      expect(review.errors["auther_name"]).to include("can't be blank")
      review.auther_name = "Deb"
      expect(review.valid?).to be_truthy
    end

    it "content should be present" do
      review = build(:review, content: "")
      review.valid?
      expect(review.errors["content"]).to include("can't be blank")
    end
  end

  describe "scopes" do
    let!(:review_1) { create(:review, rating: 4) }
    let!(:review_2) { create(:review, rating: 2) }
    let!(:review_3) { create(:review, rating: 5) }
    
    it "should return reviews with ratings > 4" do
      higer_rating_review = Review.high_ratings
      expect(higer_rating_review.count).to eq(2)
      expect(higer_rating_review).to include(review_1, review_3)
    end
  end
end 