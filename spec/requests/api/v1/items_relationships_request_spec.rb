require 'rails_helper'

describe "items relationships" do
  it "returns associated invoice items" do
    item = create(:item, id: 1)
    create(:invoice_item, item_id: 1)
    create(:invoice_item, item_id: 1)
    create(:invoice_item, item_id: 1)
    get "/api/v1/items/#{item.id}/invoice_items"
    invoice_items = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
  end

  it "returns associated merchant" do
    create(:merchant, name: 'bob', id: 1)
    item = create(:item, id: 1,  merchant_id: 1)
    get "/api/v1/items/#{item.id}/merchant"
    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant['name']).to eq('bob')
  end
end
