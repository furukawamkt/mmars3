require "rails_helper"

RSpec.describe FaresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fares").to route_to("fares#index")
    end

    it "routes to #new" do
      expect(:get => "/fares/new").to route_to("fares#new")
    end

    it "routes to #show" do
      expect(:get => "/fares/1").to route_to("fares#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fares/1/edit").to route_to("fares#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fares").to route_to("fares#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fares/1").to route_to("fares#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fares/1").to route_to("fares#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fares/1").to route_to("fares#destroy", :id => "1")
    end

  end
end
