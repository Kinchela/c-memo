require 'rails_helper'

RSpec.describe "Wishlists", type: :request do
  let!(:user) { create(:user) }
  let!(:wishlist) { create(:wishlist) }

  describe "GET /index" do
    context "as an authenticated user" do
      it "returns http success" do
        sign_in user
        get wishlists_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET /new" do
    context "as an authenticated user" do
      it "returns http success" do
        sign_in user
        get new_wishlist_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST /create" do
    context "with valid attributes" do
      it "returns http redirect" do
        list_params = attributes_for(:wishlist, :valid_due_date)
        sign_in user
        post wishlists_path, params: { wishlist: list_params }
        expect(response).to have_http_status(:redirect)
      end
    end
    context "with invalid attributes" do
      it "return http unprocessable entity" do
        list_params = attributes_for(:wishlist, :invalid_due_date)
        sign_in user
        post wishlists_path, params: { wishlist: list_params }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /destroy" do
    context "as a correct user" do
      it "returns http redirect" do
        sign_in user
        delete wishlist_path(wishlist)
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
