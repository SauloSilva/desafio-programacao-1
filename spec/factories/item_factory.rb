FactoryBot.define do
  factory :item do
    description { Faker::Lorem.sentence(3) }
    price { rand(10..999) }
  end
end
