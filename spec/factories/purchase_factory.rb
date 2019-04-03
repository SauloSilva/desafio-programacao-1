FactoryBot.define do
  factory :purchase do
    merchant
    item
    purchaser
    importer
    quantity { rand(1..99) }
  end
end
