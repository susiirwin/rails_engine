require 'rails_helper'

RSpec.describe "Items CRUD API" do
  it "returns a list of items" do
    create_list(:item, 3)
    get "/api/v1/items.json"
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(3)
  end

  it "shows a single item" do
    item = create(:item, name: "shoe")
    get "/api/v1/items/#{item.id}"
    raw_item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_item["name"]).to eq("shoe")
  end
end
