require 'rails_helper'

RSpec.describe "CreateReminders", type: :request do
  describe "GET /create_reminders" do
    it "works! (now write some real specs)" do
      get create_reminders_path
      expect(response).to have_http_status(200)
    end
  end
end
