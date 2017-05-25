require 'rails_helper'

RSpec.describe "mail_templates/edit", type: :view do
  before(:each) do
    @mail_template = assign(:mail_template, MailTemplate.create!(
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit mail_template form" do
    render

    assert_select "form[action=?][method=?]", mail_template_path(@mail_template), "post" do

      assert_select "input#mail_template_name[name=?]", "mail_template[name]"

      assert_select "textarea#mail_template_content[name=?]", "mail_template[content]"
    end
  end
end
