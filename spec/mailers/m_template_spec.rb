require "rails_helper"

RSpec.describe MTemplateMailer, type: :mailer do
  describe "useTemplate" do
    let(:mail) { MTemplateMailer.useTemplate }

    it "renders the headers" do
      expect(mail.subject).to eq("Usetemplate")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
