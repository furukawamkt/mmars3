require 'rails_helper'

RSpec.describe "reserves/index", type: :view do
  before(:each) do
    assign(:reserves, [
      Reserve.create!(
        :name => "Name",
        :ent => "Ent",
        :ext => "Ext",
        :amount => 2
      ),
      Reserve.create!(
        :name => "Name",
        :ent => "Ent",
        :ext => "Ext",
        :amount => 2
      )
    ])
  end

  it "renders a list of reserves" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ent".to_s, :count => 2
    assert_select "tr>td", :text => "Ext".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
