FactoryBot.define do
  factory :item do
    product_name              { Faker::Commerce.product_name }
    product_description       { Faker::Internet.email }
    product_detail_category_id              { 'z5' + Faker::Internet.password(min_length: 6) }
    product_detail_condition_id { password }
    delivery_charge_id            { Gimei.name.first.kanji }
    prefecture_id            { Gimei.name.last.kanji }
    delivery_day_id         {  }
    price                   { Faker::Number.number(5) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
