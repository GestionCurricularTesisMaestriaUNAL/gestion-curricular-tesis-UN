require 'rails_helper'

RSpec.describe "mails_showers/new", type: :view do
  before(:each) do
    assign(:mails_shower, MailsShower.new())
  end

  it "renders new mails_shower form" do
    render

    assert_select "form[action=?][method=?]", mails_showers_path, "post" do
    end
  end
end
