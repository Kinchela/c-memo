require "rails_helper"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.describe "wishlists", type: :system do
  let!(:user) { create(:user) }

  describe "GET /wishlists" do
    context "as an authenticated user" do
      it "shows a right page and has correct contents" do
        sign_in user
        visit root_path
        click_on('Wishlists')

        expect(current_path).to eq wishlists_path
        expect(page).to have_text("欲しい物リスト")
        # expect(page).to have_selector 'h1', text: '欲しい物リスト'
        expect(page).to have_link('リスト追加')
      end
    end
  end

  describe "POST /wishlists" do
    context "with valid attributes" do
      it "creates a list" do
        sign_in user
        visit wishlists_path
        click_link('リスト追加')

        expect(current_path).to eq new_wishlist_path

        fill_in "リスト", with: "Test"
        fill_in "期日", with: 1.week.from_now.strftime("%Y-%m-%d")
        expect{
          click_button('送信')
        }.to change(Wishlist, :count).by(1)

        expect(current_path).to eq wishlists_path
        expect(page).to have_text('欲しい物リスト')
        expect(page).to have_text('Test')
        expect(page).to have_text('期日')
        expect(page).to have_text('残日数')
        expect(page).to have_text('7')
        expect(page).to have_link('削除')
        expect(page).to have_link('リスト追加')
      end
    end

    context "with invalid attributes" do
      it "fails to create a list" do
        sign_in user
        visit wishlists_path
        click_link('リスト追加')

        expect(current_path).to eq new_wishlist_path
        # expect(page).to have_current_path(new_wishlist_path)

        fill_in "リスト", with: " "
        fill_in "期日", with: 1.day.ago.strftime("%Y-%m-%d")
        expect{
          click_button('送信')
        }.to change(Wishlist, :count).by(0)
        
        # expected: "wishlists/new", got: "/wishlists"
        # expect(current_path).to eq new_wishlist_path
        # expect(page).to have_current_path(new_wishlist_path)
        expect(page).to have_text('新規リスト')
        expect(page).to have_text('リストを入力してください')
        expect(page).to have_text('期日（過去の日付は使えません）')
      end
    end
  end

  describe "DELETE /wishlist" do
    context "as a correct user" do
      it "deletes a list" do 
        sign_in user
        visit wishlists_path
        
        click_link('リスト追加')
        fill_in "リスト", with: "Test"
        fill_in "期日", with: 1.week.from_now.strftime("%Y-%m-%d")
        click_button('送信')

        expect{
          click_link('削除')
        }.to change(Wishlist, :count).by(-1)
        
        expect(current_path).to eq wishlists_path
        expect(page).to have_selector('.no-data', text: 'Empty')
      end
    end
  end
end
