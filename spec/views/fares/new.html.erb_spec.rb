require 'rails_helper'

RSpec.describe "fares/new", type: :view do
  before(:each) do
    assign(:fare, Fare.new(
      :ent => "MyString",
      :ext => "MyString",
      :price => 1
    ))
  end

  it "renders new fare form" do
    render

    assert_select "form[action=?][method=?]", fares_path, "post" do

      assert_select "input[name=?]", "fare[ent]"

      assert_select "input[name=?]", "fare[ext]"

      assert_select "input[name=?]", "fare[price]"
    end
  end
end
