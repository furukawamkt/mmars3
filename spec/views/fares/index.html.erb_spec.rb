require 'rails_helper'

RSpec.describe "fares/index", type: :view do
  before(:each) do
    assign(:fares, [
      Fare.create!(
        :ent => "Ent",
        :ext => "Ext",
        :price => 2
      ),
      Fare.create!(
        :ent => "Ent",
        :ext => "Ext",
        :price => 2
      )
    ])
  end

  it "renders a list of fares" do
    render
    assert_select "tr>td", :text => "Ent".to_s, :count => 2
    assert_select "tr>td", :text => "Ext".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
