require "rails_helper"

RSpec.describe CreateRemindersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/create_reminders").to route_to("create_reminders#index")
    end

    it "routes to #new" do
      expect(:get => "/create_reminders/new").to route_to("create_reminders#new")
    end

    it "routes to #show" do
      expect(:get => "/create_reminders/1").to route_to("create_reminders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/create_reminders/1/edit").to route_to("create_reminders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/create_reminders").to route_to("create_reminders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/create_reminders/1").to route_to("create_reminders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/create_reminders/1").to route_to("create_reminders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/create_reminders/1").to route_to("create_reminders#destroy", :id => "1")
    end

  end
end
