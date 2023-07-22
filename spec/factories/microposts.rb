FactoryBot.define do
  factory :micropost do
    title { "MyString" }
    content { "MyText" }
    user { nil }
  end
end
