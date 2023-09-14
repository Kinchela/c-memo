FactoryBot.define do
  factory :record do
    date { "2023-07-30" }
    height { 100 }
    weight { 10 }
    association :child
  end
end
