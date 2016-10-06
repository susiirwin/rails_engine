require 'rails_helper'

describe "transactions relationships" do
  it "returns the associated invoice" do
    invoice = create(:invoice, status: "success")
    transaction = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice["status"]).to eq("success")
  end
end
