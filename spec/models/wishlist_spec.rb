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
  end
end
