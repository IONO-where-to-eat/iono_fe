FactoryBot.define do
    factory :restaurant do
      id { Faker::Omniauth.google[:uid] }
      name { Faker::Restaurant.name }
      image_url { Faker::Internet.url }
      is_closed { Faker::Boolean.boolean }
      url { Faker::Internet.url }
      review_count { Faker::Number.number(digits: 3) }
      categories { [{ 'title' => [Faker::Restaurant.type] }] }
      rating {Faker::Number.between(from: 1, to: 5)}
      transactions { [['takeout', 'delivery', 'dine-in'].sample] }
      price { ['$','$$','$$$','$$$$','$$$$$'].sample }
      location { {display_address: [Faker::Address.full_address]} }
      display_phone { Faker::PhoneNumber.cell_phone }
      distance { Faker::Number.between(from: 100, to: 100000) }

      initialize_with { new(attributes) }
    end
  end