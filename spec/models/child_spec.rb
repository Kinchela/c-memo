require 'rails_helper'

RSpec.describe Child, type: :model do
  let!(:child) { create(:child) }

  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
    it { should have_many(:records) }
    it { should accept_nested_attributes_for(:records).allow_destroy(true) }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(child).to be_valid
    end
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(16) }
  end
end
