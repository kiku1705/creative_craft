RSpec.describe 'Category' do
  context "Validations" do
    it "name presence" do
      category = FactoryBot.build(:category, name: "", description: "Test Description")
      category.valid
      expect(category.valid).to eq(false)
      expect(category.errors["name"]).to include("can't be blank")
    end
    
    it "name length" do
      category = FactoryBot.build(:catgeory, name: "Test Category", description: "Test Description")
      catgeory.valid
      # expect(catgeory.errors["name"]).to include("")
    end
  end

  # context "associations" do

  # end
end