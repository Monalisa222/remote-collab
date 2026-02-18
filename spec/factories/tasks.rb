FactoryBot.define do
  factory :task do
    title { "Task #{Faker::Lorem.sentence(word_count: 3)}" }
    association :proposal
  end
end