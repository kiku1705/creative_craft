FactoryBot.define do
  factory :product, class: Product do
    sequence :title do |n|
      "TestProduct#{n}"
    end
    description { "Test Description" }
    active { true }
    price { 300 }
  end
end