require 'rails_helper'

RSpec.describe "mail_templates/index", type: :view do
  before(:each) do
    assign(:mail_templates, [
      MailTemplate.create!(
        :name => "Name",
        :content => "MyText"
      ),
      MailTemplate.create!(
        :name => "Name",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of mail_templates" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
