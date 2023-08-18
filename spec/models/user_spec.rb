require 'rails_helper'

RSpec.describe User, type: :model do
  # subject {
  #   described_class.new(name: "Taro",
  #                       name_id: "taroparent"
  #   )
  # }
  let!(:user) { create(:user) }

  describe "Associations" do
    it { should have_many(:children) }
    it { should have_many(:wishlists) }
    it { should have_many(:microposts) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without a name" do
      user.name = nil
      expect(user).to_not be_valid
    end

    it "is not valid without a name_id" do
      user.name_id = nil
      expect(user).to_not be_valid
    end

    it { should validate_uniqueness_of(:name_id).on(:create).ignoring_case_sensitivity }
    it { should validate_length_of(:name).is_at_most(16) }
    it { should validate_length_of(:name_id).
      is_at_least(6).is_at_most(16) }
  end
end
