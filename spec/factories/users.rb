FactoryBot.define do
  factory :user do
    name { "MyString" }
    # name_id { "mystring" }
    sequence(:name_id) { |n| "mystring#{n}"}
    password { "Password123" }
  end
end
