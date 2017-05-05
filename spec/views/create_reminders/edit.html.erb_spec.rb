require 'rails_helper'

RSpec.describe "create_reminders/edit", type: :view do
  before(:each) do
    @create_reminder = assign(:create_reminder, CreateReminder.create!(
      :state => "MyString"
    ))
  end

  it "renders the edit create_reminder form" do
    render

    assert_select "form[action=?][method=?]", create_reminder_path(@create_reminder), "post" do

      assert_select "input#create_reminder_state[name=?]", "create_reminder[state]"
    end
  end
end
