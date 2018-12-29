require 'rails_helper'

RSpec.describe "Fares", type: :request do
  describe "GET /fares" do
    it "works! (now write some real specs)" do
      get fares_path
      expect(response).to have_http_status(200)
    end
  end
end
