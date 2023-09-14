FactoryBot.define do
  factory :micropost do
    title { "MyString" }
    content { "MyText" }
    association :user

    trait :invalid_attributes do
      title { " " }
      content { " " }
    end

    trait :valid_attributes do
      title { "MyString" }
      content { "MyText" }
    end
  end
end
