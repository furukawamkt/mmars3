require 'rails_helper'

RSpec.describe "reserves/edit", type: :view do
  before(:each) do
    @reserve = assign(:reserve, Reserve.create!(
      :name => "MyString",
      :ent => "MyString",
      :ext => "MyString",
      :amount => 1
    ))
  end

  it "renders the edit reserve form" do
    render

    assert_select "form[action=?][method=?]", reserve_path(@reserve), "post" do

      assert_select "input[name=?]", "reserve[name]"

      assert_select "input[name=?]", "reserve[ent]"

      assert_select "input[name=?]", "reserve[ext]"

      assert_select "input[name=?]", "reserve[amount]"
    end
  end
end
