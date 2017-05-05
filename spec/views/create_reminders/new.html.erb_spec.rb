require 'rails_helper'

RSpec.describe "create_reminders/new", type: :view do
  before(:each) do
    assign(:create_reminder, CreateReminder.new(
      :state => "MyString"
    ))
  end

  it "renders new create_reminder form" do
    render

    assert_select "form[action=?][method=?]", create_reminders_path, "post" do

      assert_select "input#create_reminder_state[name=?]", "create_reminder[state]"
    end
  end
end
