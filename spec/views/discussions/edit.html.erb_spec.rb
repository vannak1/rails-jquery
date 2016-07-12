require 'rails_helper'

RSpec.describe "discussions/edit", type: :view do
  before(:each) do
    @discussion = assign(:discussion, Discussion.create!(
      :question => "MyString"
    ))
  end

  it "renders the edit discussion form" do
    render

    assert_select "form[action=?][method=?]", discussion_path(@discussion), "post" do

      assert_select "input#discussion_question[name=?]", "discussion[question]"
    end
  end
end
