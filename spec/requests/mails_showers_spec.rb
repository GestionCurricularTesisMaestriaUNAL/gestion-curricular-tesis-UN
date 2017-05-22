require 'rails_helper'

RSpec.describe "MailsShowers", type: :request do
  describe "GET /mails_showers" do
    it "works! (now write some real specs)" do
      get mails_showers_path
      expect(response).to have_http_status(200)
    end
  end
end
