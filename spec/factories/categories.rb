FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    icon { "fa-solid fa-wallet" }

    association :user
  end
end
