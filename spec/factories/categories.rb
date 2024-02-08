FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    icon { 'education.svg' }

    association :user
  end
end
