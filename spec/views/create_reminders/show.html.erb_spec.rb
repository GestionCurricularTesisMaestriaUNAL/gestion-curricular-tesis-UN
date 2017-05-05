require 'rails_helper'

RSpec.describe "create_reminders/show", type: :view do
  before(:each) do
    @create_reminder = assign(:create_reminder, CreateReminder.create!(
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/State/)
  end
end
