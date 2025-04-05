FactoryBot.define do
  factory :review do 
    rating { 3 }
    content { "This product is amazing looking forward to see my friends reaction" }
    auther_name { "XYZ" }
    association :product
  end
end