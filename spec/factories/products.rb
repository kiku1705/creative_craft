FactoryBot.define  do
  factory :product do
    sequence :title do |n|
      "TestProduct#{n}"
    end
    description { "Test Description" }
    active { true }
    price { 300 }
    stock_quantity { 5 }
    association :category
  end
end