require 'rails_helper'

RSpec.describe "mails_showers/edit", type: :view do
  before(:each) do
    @mails_shower = assign(:mails_shower, MailsShower.create!())
  end

  it "renders the edit mails_shower form" do
    render

    assert_select "form[action=?][method=?]", mails_shower_path(@mails_shower), "post" do
    end
  end
end
