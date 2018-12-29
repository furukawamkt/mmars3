require 'rails_helper'

RSpec.describe "fares/show", type: :view do
  before(:each) do
    @fare = assign(:fare, Fare.create!(
      :ent => "Ent",
      :ext => "Ext",
      :price => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ent/)
    expect(rendered).to match(/Ext/)
    expect(rendered).to match(/2/)
  end
end
