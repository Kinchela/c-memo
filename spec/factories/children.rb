FactoryBot.define do
  factory :child do
    name { "MyString" }
    association :user
    # user_id { 1 }
    # The asscociation will automatically create a new user record and assign its ID to the 'user_id' attribute of the child.
  end
end
