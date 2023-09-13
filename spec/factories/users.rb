FactoryBot.define do
  factory :user do
    name { "MyString" }
    sequence(:name_id) { |n| "mystring#{n}" }
    password { "Password123" }
    password_confirmation { "Password123" }

    trait :invalid_attributes do
      name { " " }
      sequence(:name_id) { |n| "mystringmystring#{n}" }
      password { "Password123" }
      password_confirmation { "Password321" }
    end

    trait :valid_attributes do
      name { "MyString" }
      sequence(:name_id) { |n| "mystring#{n}" }
      password { "Password123" }
      password_confirmation { "Password123" }
    end

    trait :invalid_attributes_signin do
      sequence(:name_id) { " " }
      password { "Password321" }
    end

    trait :valid_attributes_signin do
      sequence(:name_id) { |n| "mystring#{n}" }
      password { "Password123" }
    end

    trait :invalid_attributes_update do
      sequence(:name_id) { |n| "mystring#{n}" }
      password { "Password456" }
      password_confirmation { "Password456" }
      current_password { "Password321" }
    end

    trait :valid_attributes_update do
      sequence(:name_id) { |n| "mystring#{n}" }
      password { "Password456" }
      password_confirmation { "Password456" }
      current_password { "Password123" }
    end
  end
end
