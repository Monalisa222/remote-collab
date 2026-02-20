FactoryBot.define do
  factory :proposal do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    association :organization
    association :user
  end
end
