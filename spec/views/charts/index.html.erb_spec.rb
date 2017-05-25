require 'rails_helper'

RSpec.describe "charts/index", type: :view do
  before(:each) do
    assign(:charts, [
      Chart.create!(),
      Chart.create!()
    ])
  end

  it "renders a list of charts" do
    render
  end
end
