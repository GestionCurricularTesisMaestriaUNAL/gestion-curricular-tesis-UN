require 'rails_helper'

RSpec.describe "mail_templates/new", type: :view do
  before(:each) do
    assign(:mail_template, MailTemplate.new(
      :name => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new mail_template form" do
    render

    assert_select "form[action=?][method=?]", mail_templates_path, "post" do

      assert_select "input#mail_template_name[name=?]", "mail_template[name]"

      assert_select "textarea#mail_template_content[name=?]", "mail_template[content]"
    end
  end
end
