require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  let!(:wishlist) { create(:wishlist) }

  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
  end

  describe "Validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:due_date) }
    it { should validate_presence_of(:list) }
    it { should validate_length_of(:list).is_at_most(50) }

    context "with a valid attribute" do
      it "is valid with future due date including today" do
        wishlist = build(:wishlist, :valid_due_date)
        expect(wishlist).to be_valid
      end
    end

    context "with an invalid attribute" do
      # let!(:user) { create(:user) }
      it "is not valid with past due date" do
        wishlist = build(:wishlist, :invalid_due_date)
        expect(wishlist).not_to be_valid
        expect(wishlist.errors[:due_date]).to include("（過去の日付は使えません）")
      end
    end
  end
end
