FactoryBot.define do
  factory :user, class: User do
    sequence :full_name do |n|
      "Test User#{n}"
    end
    sequence :email do |n|
     "test#{n}@gmail.com"
    end
    phone_number { "9888886734" }
    password { '12345' }

    trait :admin do
      type { 'Admin' }
    end

    trait :customer do
      type { 'Customer' }
    end
  end
end
