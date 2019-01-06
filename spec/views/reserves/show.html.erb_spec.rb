require 'rails_helper'

RSpec.describe "reserves/show", type: :view do
  before(:each) do
    @reserve = assign(:reserve, Reserve.create!(
      :name => "Name",
      :ent => "Ent",
      :ext => "Ext",
      :amount => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Ent/)
    expect(rendered).to match(/Ext/)
    expect(rendered).to match(/2/)
  end
end
