require 'rails_helper'

describe "merchants relationships" do
  it "returns a list of merchant items" do
    merchant = create(:merchant, id: 1)
    create(:item, merchant_id: 1)
    create(:item, merchant_id: 1)
    create(:item, merchant_id: 1)
    get "/api/v1/merchants/#{merchant.id}/items"
    items = JSON.parse(response.body)
    expect(response).to be_success
    expect(items.count).to eq(3)
  end

  it "returns a list of merchant invoices" do
    merchant = create(:merchant, id: 1)
    create(:invoice, merchant_id: 1)
    create(:invoice, merchant_id: 1)
    create(:invoice, merchant_id: 1)
    get "/api/v1/merchants/#{merchant.id}/invoices"
    items = JSON.parse(response.body)
    expect(response).to be_success
    expect(items.count).to eq(3)
  end
end
