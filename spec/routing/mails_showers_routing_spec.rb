require "rails_helper"

RSpec.describe MailsShowersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mails_showers").to route_to("mails_showers#index")
    end

    it "routes to #new" do
      expect(:get => "/mails_showers/new").to route_to("mails_showers#new")
    end

    it "routes to #show" do
      expect(:get => "/mails_showers/1").to route_to("mails_showers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mails_showers/1/edit").to route_to("mails_showers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mails_showers").to route_to("mails_showers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mails_showers/1").to route_to("mails_showers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mails_showers/1").to route_to("mails_showers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mails_showers/1").to route_to("mails_showers#destroy", :id => "1")
    end

  end
end
