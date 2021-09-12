FactoryBot.define do
  factory :item do
    product_name    {'オムライス'}
    explanation     {'できたてホヤホヤ、美味しいオムライスはいかがですか？'}
    category_id     {1}
    status_id       {1}
    delivery_fee_id {1}
    prefecture_id   {1}
    days_id         {1}
    price           {1000}
    association :user

    #after(:build) do |item|
     # item.image.attach(io: File.open('public/images/test_Omelette_rice.png'), filename: 'test_Omelette_rice.png')
    #end
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_Omelette_rice.png'), filename: 'test_Omelette_rice.png')
    end
  end
end
