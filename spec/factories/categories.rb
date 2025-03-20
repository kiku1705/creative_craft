FactoryBot.define do
  factory :category, class: Category do
    sequence :name do |n|
      "TestCategory#{n}"
    end
    description { "Test Description" }
    # active { true }

    # factory :category_with_products do
    #   products { [association(:products)] }
    # end
    factory :category_with_products do
      transient do
        products_count { 5 }
      end

      after(:create) do |category, evaluator|
        create_list(:product, evaluator.products_count, category: category)

        # You may need to reload the record here, depending on your application
        category.reload
      end
    end
  end
end