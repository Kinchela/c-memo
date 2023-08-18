require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let!(:micropost) { create(:micropost) }

  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(micropost).to be_valid
    end
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:title).is_at_most(30) }
    it { should validate_length_of(:content).is_at_most(280) }
  end
end
