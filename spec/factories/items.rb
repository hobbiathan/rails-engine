FactoryBot.define do
    factory :item do
      name { Faker::StarWars.character }
      description { Faker::Blockchain::Bitcoin.address }
      unit_price { Faker::Number.decimal(l_digits: 2) }
      merchant_id nil
    end
  end