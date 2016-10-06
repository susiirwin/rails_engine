require 'rails_helper'

describe "invoice_items relationships" do
  it "returns a the associated invoice" do
    create(:invoice, id: 1, status: 'boom')
    invoice_item = create(:invoice_item, invoice_id: 1)
    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"
    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice['status']).to eq('boom')
  end

  it "returns a the associated item" do
    create(:item, id: 1, name: 'broom')
    invoice_item = create(:invoice_item, item_id: 1)
    get "/api/v1/invoice_items/#{invoice_item.id}/item"
    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice['name']).to eq('broom')
  end
end
