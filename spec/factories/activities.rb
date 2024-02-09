FactoryBot.define do
  factory :activity do
    name { Faker::Lorem.word }
    amount { Faker::Number.decimal(l_digits: 2) }

    association :author, factory: :user
    categories { [association(:category)] }
  end
end
