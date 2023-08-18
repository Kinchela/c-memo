FactoryBot.define do
  factory :micropost do
    title { "MyString" }
    content { "MyText" }
    association :user
  end
end
