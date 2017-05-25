require 'rails_helper'

RSpec.describe "create_reminders/index", type: :view do
  before(:each) do
    assign(:create_reminders, [
      CreateReminder.create!(
        :state => "State"
      ),
      CreateReminder.create!(
        :state => "State"
      )
    ])
  end

  it "renders a list of create_reminders" do
    render
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
