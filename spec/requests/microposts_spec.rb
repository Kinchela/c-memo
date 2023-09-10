require 'rails_helper'

RSpec.describe "Microposts", type: :request do
  let!(:user) { create(:user) }
  let!(:micropost) { create(:micropost) }

  describe "POST /create" do
    context "with valid attributes" do
      it "returns http redirect" do
        micropost_params = attributes_for(:micropost, :valid_attributes)
        sign_in user
        post microposts_path, params: { micropost: micropost_params }
        expect(response).to have_http_status(:redirect)
      end
    end
    context "with invalid attributes" do
      it "returns http redirect" do
        micropost_params = attributes_for(:micropost, :invalid_attributes)
        sign_in user
        post microposts_path, params: { micropost: micropost_params }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /destroy" do
    context "as a correct user" do
      it "returns http redirect" do
        sign_in user
        delete micropost_path(micropost)
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
