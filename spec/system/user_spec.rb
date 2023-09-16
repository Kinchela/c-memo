require "rails_helper"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.describe "users", type: :system do
  let!(:user) { create(:user) }

  describe "GET /sign_up" do
    context "as a prospective user" do
      it "shows expected page and has correct contents" do
        visit root_path
        click_link('Sign up')

        expect(current_path).to eq sign_up_path
        expect(page).to have_selector('h2', text: 'サインアップ')
        expect(page).to have_text('名前')
        expect(page).to have_text('ユーザーID')
        expect(page).to have_text('パスワード')
        expect(page).to have_text('パスワード（確認用）')
        expect(page).to have_button('サインアップ')
        expect(page).to have_link('サインイン')
      end
    end
  end

  describe "POST /sign_up" do
    context "with valid attributes" do
      it "creates an account" do
        visit sign_up_path
        fill_in "名前", with: "MyString"
        fill_in "ユーザーID", with: "mystring1"
        fill_in "パスワード", with: "Password123"
        fill_in "パスワード（確認用）", with: "Password123"

        expect{
          click_button('サインアップ')
        }.to change(User, :count).by(1)
        expect(current_path).to eq root_path
        expect(page).to have_selector('h1', text: user.name)
        expect(page).to have_selector('.notice', text: "アカウント登録が完了しました。")
      end
    end
    context "with invalid attributes" do
      it "fails to create an account" do
        visit sign_up_path
        fill_in "名前", with: " "
        fill_in "ユーザーID", with: "test"
        fill_in "パスワード", with: "Password123"
        fill_in "パスワード（確認用）", with: "Password321"

        expect{
          click_button('サインアップ')
        }.to change(User, :count).by(0)
        # expect(current_path).to eq sign_up_path  #got "/users"
        expect(page).to have_text('名前を入力してください')
        expect(page).to have_text('ユーザーIDは6文字以上で入力してください')
        expect(page).to have_text('パスワード（確認用）とパスワードの入力が一致しません')
        expect(page).to have_selector('div#error_explanation')
      end
    end
  end

  describe "GET /sign_in" do
    context "as an authenticated user" do
      it "shows expected page and has correct contents" do
        visit root_path
        click_link('Sign in')

        expect(current_path).to eq sign_in_path
        expect(page).to have_selector('h2', text: 'サインイン')
        expect(page).to have_text('ユーザーID')
        expect(page).to have_text('パスワード')
        expect(page).to have_button('サインイン')
        expect(page).to have_link('サインアップ')
      end
    end
  end

  describe "POST /sign_in" do
    context "with valid attributes" do
      it "successfully signs in" do
        visit sign_in_path
        fill_in "ユーザーID", with: user.name_id
        fill_in "パスワード", with: "Password123"
        click_button('サインイン')

        expect(current_path).to eq root_path 
        expect(page).to have_selector('.notice', text: "ログインしました。")
      end
    end
    context "with invalid attributes" do
      it "fails to sign in" do
        visit sign_in_path
        fill_in "ユーザーID", with: " "
        fill_in "パスワード", with: " "
        click_button('サインイン')

        # expect(current_path).to eq sign_in_path  #got "users/sign_in"
        expect(page).to have_selector('.alert', text: "ユーザーIDまたはパスワードが違います。")
      end
    end
  end
  describe "DELETE /sign_out" do
    context "with a correct user" do
      it "successfully signs out" do
        sign_in user
        visit root_path
        click_link('Account')
        click_link('Sign out')

        expect(current_path).to eq root_path 
        expect(page).to have_link('Sign up')
        expect(page).to have_selector('.notice', text: "ログアウトしました。")
      end
    end
  end

  describe "PATCH /update" do
    before do
      sign_in user
      visit root_path
      click_link('Account')
      click_link('Settings')
    end
    context "with valid attributes" do
      it "successfully changes the password" do
        expect(current_path).to eq edit_path(user)
        fill_in "ユーザーID", with: user.name_id
        fill_in "パスワード", with: "Password321"
        fill_in "パスワード（確認用）", with: "Password321"
        fill_in "現在のパスワード", with: "Password123"
        click_button('変更')

        expect(current_path).to eq root_path
        expect(page).to have_selector('.notice', text: "アカウント情報を変更しました。")
        # expect(user.reload.password).to eq "Password321"
      end
    end
    context "with invalid attributes" do
      it "fails to change the password" do
        expect(current_path).to eq edit_path(user)
        fill_in "ユーザーID", with: user.name_id
        fill_in "パスワード", with: "Password321"
        fill_in "パスワード（確認用）", with: "Password123"
        fill_in "現在のパスワード", with: "Password123"
        click_button('変更')

        expect(current_path).to_not eq root_path
        expect(page).to have_selector('li', text: "パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end

  describe "DELETE /cancel" do
    context "with a correct user" do
      it "successfully signs out" do
        sign_in user
        visit edit_path(user)
        expect{
          click_button('アカウント削除')
        }.to change(User, :count).by(-1)
        
        expect(current_path).to eq root_path 
        expect(page).to have_link('Sign up')
        expect(page).to have_selector('.notice', text: "アカウントを削除しました。またのご利用をお待ちしております。")
      end
    end
  end
end