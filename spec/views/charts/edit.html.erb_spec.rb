require 'rails_helper'

RSpec.describe "charts/edit", type: :view do
  before(:each) do
    @chart = assign(:chart, Chart.create!())
  end

  it "renders the edit chart form" do
    render

    assert_select "form[action=?][method=?]", chart_path(@chart), "post" do
    end
  end
end
