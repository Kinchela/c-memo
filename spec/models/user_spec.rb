require 'rails_helper'

RSpec.describe User, type: :model do
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
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:name_id) }
    it { should validate_uniqueness_of(:name_id).on(:create).ignoring_case_sensitivity }
    it { should validate_length_of(:name).is_at_most(16) }
    it { should validate_length_of(:name_id).
      is_at_least(6).is_at_most(16) }
  end
end
