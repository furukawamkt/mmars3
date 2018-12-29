require 'rails_helper'

RSpec.describe "fares/edit", type: :view do
  before(:each) do
    @fare = assign(:fare, Fare.create!(
      :ent => "MyString",
      :ext => "MyString",
      :price => 1
    ))
  end

  it "renders the edit fare form" do
    render

    assert_select "form[action=?][method=?]", fare_path(@fare), "post" do

      assert_select "input[name=?]", "fare[ent]"

      assert_select "input[name=?]", "fare[ext]"

      assert_select "input[name=?]", "fare[price]"
    end
  end
end
