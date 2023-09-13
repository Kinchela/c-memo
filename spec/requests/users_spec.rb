require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) { create(:user) }

  describe "GET /new" do 
    context "as a prospective user" do
      it "returns http success" do
        get sign_up_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST /create" do
    context "with valid attributes" do
      it "returns http redirect" do
        user_params = attributes_for(:user, :valid_attributes)
        post sign_up_path, params: { user: user_params }
        expect(response).to have_http_status(:redirect)
      end
    end

    context "with invalid attributes" do
      it "returns http unprocessable entity" do
        user_params = attributes_for(:user, :invalid_attributes)
        post sign_up_path, params: { user: user_params }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "GET /new" do 
    context "as a authenticated user" do
      it "returns http success" do
        get sign_in_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST /create" do
    context "with valid attributes" do
      it "returns http redirect" do 
        sign_in user
        post sign_in_path
        expect(response).to have_http_status(:redirect)
      end
    end

    context "with invalid attributes" do
      it "returns http unprocessable_entity" do
        user_signin_params = attributes_for(:user, :invalid_attributes_signin)
        post sign_in_path, params: { user: user_signin_params }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /destroy" do
    context "with a correct user" do
      it "returns http success" do
        sign_in user
        delete sign_out_path(user)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET /edit" do
    context "with a correct user" do
      it "returns http success" do
        sign_in user
        get edit_path(user)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "PATCH /update" do
    before do
      sign_in user
      get edit_path(user)
    end
    context "with valid attributes" do
      it "returns http redirect" do
        user_update_params = attributes_for(:user, :valid_attributes_update)
        patch user_registration_path, params: { user: user_update_params }
        expect(response).to have_http_status(:redirect)
      end
    end
    context "with invalid attributes" do
      it "returns http unprocessable entity" do
        user_update_params = attributes_for(:user, :invalid_attributes_update)
        patch user_registration_path, params: { user: user_update_params }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /cancel" do
    context "with a correct user" do
      it "returns http redirect" do
        sign_in user
        delete cancel_path(user)
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
