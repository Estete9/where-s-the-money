FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    icon { 'education' }

    association :user
  end
end
