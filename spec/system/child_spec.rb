require "rails_helper"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.describe "children", type: :system do
  let!(:user) { create(:user) }

  describe "GET /children" do
    context "as an authenticated user" do
      it "shows a right page and has correct contents" do
        sign_in user
        visit root_path
        click_on('Measurement')

        expect(current_path).to eq children_path
        expect(page).to have_text("身体測定")
        expect(page).to have_text("名前")
        expect(page).to have_text("日付")
        expect(page).to have_text("身長 (cm)")
        expect(page).to have_text("体重 (kg)")
        expect(page).to have_button('送信')
      end
    end
  end

  describe "POST /children" do
    context "with valid attributes" do
      it "creates charts for height and weight" do
        sign_in user
        visit children_path

        expect(current_path).to eq children_path

        fill_in "名前", with: "Test"
        fill_in "日付", with: Date.today.strftime("%Y-%m-%d")
        fill_in "身長 (cm)", with: "100"
        fill_in "体重 (kg)", with: "15"
        click_button('送信')

        expect(current_path).to eq children_path
        expect(page).to have_selector('#chart-1')
        expect(page).to have_selector('#chart-2')
      end
    end
    context "with invalid attributes" do
      it "displays error messages" do
        sign_in user
        visit children_path

        expect(current_path).to eq children_path
        expect{ 
          fill_in "名前", with: " "
          fill_in "日付", with: " "
          fill_in "身長 (cm)", with: "100"
          fill_in "体重 (kg)", with: "15"
          click_button('送信')
        }.to change(Child, :count).by 0

        expect(current_path).to eq children_path
        expect(page).to have_text('日付を入力してください')
        expect(page).to have_text('名前を入力してください')
      end
    end
  end
end