require "rails_helper"

RSpec.describe MailTemplatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mail_templates").to route_to("mail_templates#index")
    end

    it "routes to #new" do
      expect(:get => "/mail_templates/new").to route_to("mail_templates#new")
    end

    it "routes to #show" do
      expect(:get => "/mail_templates/1").to route_to("mail_templates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mail_templates/1/edit").to route_to("mail_templates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mail_templates").to route_to("mail_templates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/mail_templates/1").to route_to("mail_templates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/mail_templates/1").to route_to("mail_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mail_templates/1").to route_to("mail_templates#destroy", :id => "1")
    end

  end
end
