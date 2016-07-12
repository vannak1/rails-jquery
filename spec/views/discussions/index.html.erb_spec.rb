require 'rails_helper'

RSpec.describe "discussions/index", type: :view do
  before(:each) do
    assign(:discussions, [
      Discussion.create!(
        :question => "Question"
      ),
      Discussion.create!(
        :question => "Question"
      )
    ])
  end

  it "renders a list of discussions" do
    render
    assert_select "tr>td", :text => "Question".to_s, :count => 2
  end
end
