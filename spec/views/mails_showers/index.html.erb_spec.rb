require 'rails_helper'

RSpec.describe "mails_showers/index", type: :view do
  before(:each) do
    assign(:mails_showers, [
      MailsShower.create!(),
      MailsShower.create!()
    ])
  end

  it "renders a list of mails_showers" do
    render
  end
end
