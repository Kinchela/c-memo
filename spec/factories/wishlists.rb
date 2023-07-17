FactoryBot.define do
  factory :wishlist do
    due_date { "2023-07-14" }
    list { "MyString" }
    user { nil }
  end
end
