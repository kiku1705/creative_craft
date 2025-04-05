require 'rails_helper'
require 'pry'
RSpec.describe 'Product' do
  describe "validations" do
    it "name can't be blank" do
      product = FactoryBot.build(:product, title: '')
      expect(product.valid?).to be_falsey
      expect(product.errors["title"]).to include("can't be blank")
    end

    it "description can't be blank" do
      product = FactoryBot.build(:product, description: "")
      product.valid?
      expect(product.errors["description"]).to include("can't be blank")
    end

    it "price must be greater than 0.0" do
      product = FactoryBot.build(:product, price: 0.0)
      product.valid?
      expect(product.errors["price"]).to include("must be greater than 0")
      product = FactoryBot.build(:product, title: "Fridge Magnet", description: "This fridge magnet is a box of memories that tells you a story", price: 30)
      expect(product.valid?).to be_truthy
    end

    it "images should be max 1 GB" do
      product = FactoryBot.build(:product)
      product.images  = [Rack::Test::UploadedFile.new(Rails.root.join("spec", "supports", "images", "large"))]
      product.valid?
      expect(product.errors["images"]).to include("max image size supported is 1 MB")
      expect(product.errors["images"]).to include("must be a JPEG, PNG, or GIF")
    end
  end

  describe "scopes" do
    let!(:product_1) { create(:product, price: 300, stock_quantity: 0) }
    let!(:product_2) { create(:product, price: 500, stock_quantity: 5) }
    let!(:product_3) { create(:product, price: 150, stock_quantity: 0) }
    let!(:product_4) { create(:product, price: 250, stock_quantity: 3) }
    let!(:product_5) { create(:product, price: 20, stock_quantity: 5) }

    it "returns available products, stock_quantity greater than 0" do 
      available_products = Product.available
      expect(available_products.count).to eq(3)
      expect(available_products).to include(product_2, product_4, product_5)
      expect(available_products).not_to include(product_1)
    end

    it "returns products under mentioned price" do 
      products_200 = Product.under_price(200)
      expect(products_200.count).to eq(2)
      expect(products_200).to include(product_3, product_5)
      expect(products_200).not_to include(product_1, product_2, product_4)
    end
  end
end