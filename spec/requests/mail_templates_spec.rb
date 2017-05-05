require 'rails_helper'

RSpec.describe "MailTemplates", type: :request do
  describe "GET /mail_templates" do
    it "works! (now write some real specs)" do
      get mail_templates_path
      expect(response).to have_http_status(200)
    end
  end
end
