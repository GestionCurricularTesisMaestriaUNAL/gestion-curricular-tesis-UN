require 'rails_helper'

RSpec.describe "mail_templates/show", type: :view do
  before(:each) do
    @mail_template = assign(:mail_template, MailTemplate.create!(
      :name => "Name",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
