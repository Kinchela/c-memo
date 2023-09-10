require "rails_helper"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.describe "microposts", type: :system do
  let!(:user) { create(:user) }
  # let!(:micropost) { create(:micropost) }

  describe "Home" do
    context "as an authenticated user" do
      it "displays a right page and has correct contents" do
        sign_in user
        visit root_path

        expect(page).to have_selector('h1', text: user.name)
        expect(page).to have_text('タイトル')
        expect(page).to have_text('出来事')
        expect(page).to have_button('投稿')
        expect(page).to have_selector('h3', text: '日記一覧')
        expect(page).to have_selector('.no-data', text: 'Empty')
      end
    end
  end
  describe "Pagination" do
    context "with 25 microposts" do
      it "displays 20 microposts" do
        # microposts = create_list(:micropost, 25)
        sign_in user
        visit root_path
        25.times do
          fill_in "タイトル", with: "TitleTest"
          fill_in "出来事", with: "ContentTest"
          click_button('投稿')
        end

        posts_wrapper = within 'ol.microposts' do
          find_all('li')
        end
        expect(posts_wrapper.size).to eq 20
        expect(page).to have_selector('li#micropost-24')
        expect(page).to_not have_selector('li#micropost-4')
        expect(page).to have_selector('ul.pagination')
      end
    end
  end
  describe "POST /microposts" do
    context "with valid attributes" do
      it "creates a micropost" do
        sign_in user
        visit root_path
        fill_in "タイトル", with: "TitleTest"
        fill_in "出来事", with: "ContentTest"
        attach_file 'micropost_images', "#{Rails.root}/spec/fixtures/kitten.jpg", make_visible: true

        expect{
          click_button('投稿')
        }.to change(Micropost, :count).by(1)
        expect(page).to have_text('TitleTest')
        expect(page).to have_text('ContentTest')
        expect(page).to have_selector('span.timestamp')
        expect(page).to have_link('削除')
        attached_post = Micropost.first
        expect(attached_post.images).to be_attached
      end
    end

    context "with invalid attributes" do
      it "fails to create a micropost" do
        sign_in user
        visit root_path
        fill_in "タイトル", with: "a"*31
        fill_in "出来事", with: " "

        expect{
          click_button('投稿')
        }.to change(Micropost, :count).by(0)
        expect(page).to have_text('タイトルは30文字以内で入力してください')
        expect(page).to have_text('内容を入力してください')
      end
    end
  end
  describe "DELETE /microposts" do
    context "as a correct user" do
      it "deletes a micropost" do
        sign_in user
        visit root_path
        fill_in "タイトル", with: "TitleTest"
        fill_in "出来事", with: "ContentTest"
        click_button('投稿')

        expect{
          click_link('削除')
        }.to change(Micropost, :count).by(-1)

        expect(current_path).to eq root_path
        expect(page).to have_selector('.no-data', text: 'Empty')
      end
    end
  end
end
        