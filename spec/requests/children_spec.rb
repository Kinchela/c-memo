require 'rails_helper'

RSpec.describe "Children", type: :request do
  let!(:user) { create(:user) }
  let!(:child) { create(:child) }

  describe "GET /index" do
    it "returns http success" do
      sign_in user
      get children_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    before do
      @record_params = { 
        records_attributes: { 
          "0": attributes_for(:record)
        }
      }
      @data_params = { 
        child: attributes_for(:child).merge(@record_params)
      }
    end
    it "returns http redirect" do
      sign_in user
      post children_path, params: @data_params
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "POST /create" do
    before do
      @record_params = { 
        records_attributes: { 
          "0": attributes_for(:record)
        }
      }
      @data_params = { 
        child: attributes_for(:child, :invalid_name).merge(@record_params)
      }
    end
    it "returns http unprocessable entity" do
      sign_in user
      post children_path, params: @data_params
      expect(response).to have_http_status(422)
    end
  end
end