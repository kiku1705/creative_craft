require 'rails_helper'
RSpec.describe 'Category' do
  context "Validations" do
    it "name presence" do
      category = FactoryBot.build(:category, name: "", description: "Test Description")
      category.valid?
      expect(category.valid?).to eq(false)
      expect(category.errors["name"]).to include("can't be blank")
    end
    
    it "name length" do
      category = FactoryBot.build(:category, name: "T", description: "Test Description")
      category.valid?
      expect(category.errors["name"]).to include("is too short (minimum is 3 characters)")
      category.name  = "Here's a breakdown of categories for craft items, encompassing various"
      category.valid?
      expect(category.errors["name"]).to include("is too long (maximum is 30 characters)")
    end
  end
end