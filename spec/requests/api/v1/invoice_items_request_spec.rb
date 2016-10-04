require 'rails_helper'

RSpec.describe "Invoice Items CRUD API" do
  it "returns a list of invoice items" do
    create_list(:invoiceitem, 3)
    get "/api/v1/invoice_items.json"
    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
  end

  it "shows a single invoice item" do
    invoice_item = create(:invoiceitem, quantity: 5)
    get "/api/v1/invoice_items/#{invoice_item.id}"
    raw_invoice_item = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_invoice_item["quantity"]).to eq(5)
  end
end
