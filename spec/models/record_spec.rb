require 'rails_helper'

RSpec.describe Record, type: :model do

  # let!(:child) {
  #   Child.new(name: "Kotaro", id: "1")
  # }
  # subject { 
  #   described_class.new(date: Date.today,
  #                       height: 100,
  #                       weight: 15,
  #                       child: child
  #   ) 
  # }
  let!(:record) { create(:record) }

  describe "Associations" do
    it { should belong_to(:child).without_validating_presence }
  end

  describe "Validations" do
    it { should validate_presence_of(:child) }
    it { should validate_presence_of(:date) }

    context "When weight is not present" do
      before { record.weight = nil }
      it { should validate_presence_of(:height) }
    end

    context "When height is not present" do
      before { record.height = nil }
      it { should validate_presence_of(:weight) }
    end
  end

  it "is valid with valid attributes" do
    expect(record).to be_valid
  end

  it "is not valid without a date" do
    record.date = nil
    expect(record).to_not be_valid
  end

  it "is not valid if both attributes, height and weight, are nil " do
    record.height = nil
    record.weight = nil
    expect(record).to_not be_valid
  end
end
