FactoryBot.define do
  factory :child do
    name { "MyString" }
    association :user

    trait :with_nested_instances do
      after(:create) do |child|
        create :record, id: child.id
        # create(:record, child: child)
      end
    end
    # user_id { 1 }
    # The asscociation will automatically create a new user record and assign its ID to the 'user_id' attribute of the child.

    trait :invalid_name do
      name { " " }
    end
  end
end

