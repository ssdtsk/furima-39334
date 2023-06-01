FactoryBot.define do
  factory :item do
    product_name                            { Faker::Commerce.product_name }
    product_description                     { Faker::Lorem.characters }
    product_detail_category_id              { Faker::Number.between(from: 2,to: 11) }
    product_detail_condition_id             { Faker::Number.between(from: 2,to: 7) }
    delivery_charge_id                      { Faker::Number.between(from: 2,to: 3) }
    prefecture_id                           { Faker::Number.between(from: 2,to: 48) }
    delivery_day_id                         { Faker::Number.between(from: 2,to: 4) }
    price                                   { Faker::Number.number(digits: 5) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end