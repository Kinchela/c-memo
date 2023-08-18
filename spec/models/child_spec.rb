require 'rails_helper'

RSpec.describe Child, type: :model do

  # let!(:user) {
  #   User.new(name: "Taro", name_id: "taroparent", id: 1)
  # }
  # subject { 
  #   described_class.new(name: "Kotaro",
  #                       user: user
  #   ) 
  # }
  let!(:child) { create(:child) }

  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
    it { should have_many(:records) }
    it { should accept_nested_attributes_for(:records).allow_destroy(true) }
  end

  it "is valid with valid attributes" do
    expect(child).to be_valid
  end

  it "is not valid without a name" do
    child.name = nil
    expect(child).to_not be_valid
  end
end
