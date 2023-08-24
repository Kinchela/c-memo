FactoryBot.define do
  factory :wishlist do
    due_date { 1.week.from_now }
    list { "MyString" }
    association :user

    trait :invalid_due_date do
      due_date { Date.yesterday }
    end

    trait :valid_due_date do
      due_date { Date.today }
    end
  end
end
