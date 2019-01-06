require 'rails_helper'

RSpec.describe "reserves/new", type: :view do
  before(:each) do
    assign(:reserve, Reserve.new(
      :name => "MyString",
      :ent => "MyString",
      :ext => "MyString",
      :amount => 1
    ))
  end

  it "renders new reserve form" do
    render

    assert_select "form[action=?][method=?]", reserves_path, "post" do

      assert_select "input[name=?]", "reserve[name]"

      assert_select "input[name=?]", "reserve[ent]"

      assert_select "input[name=?]", "reserve[ext]"

      assert_select "input[name=?]", "reserve[amount]"
    end
  end
end
