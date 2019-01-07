require 'rails_helper'

RSpec.describe TxController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #reserve" do
    it "returns http success" do
      get :reserve
      expect(response).to have_http_status(:success)
    end
  end

end
