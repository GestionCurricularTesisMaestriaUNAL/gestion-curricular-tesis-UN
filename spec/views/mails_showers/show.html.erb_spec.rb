require 'rails_helper'

RSpec.describe "mails_showers/show", type: :view do
  before(:each) do
    @mails_shower = assign(:mails_shower, MailsShower.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
