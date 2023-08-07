FactoryBot.define do
  factory :record do
    date { "2023-07-30" }
    height { "9.99" }
    weight { "9.99" }
    child { nil }
  end
end
