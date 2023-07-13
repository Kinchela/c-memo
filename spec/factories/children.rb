FactoryBot.define do
  factory :child do
    name { "MyString" }
    date { "2023-07-11" }
    height { "9.99" }
    weight { "9.99" }
    waist { "9.99" }
    user { nil }
  end
end
