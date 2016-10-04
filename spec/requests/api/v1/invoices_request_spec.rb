require 'rails_helper'

RSpec.describe "Invoices CRUD API" do
  it "returns a list of invoices" do
    create_list(:invoice, 3)
    get "/api/v1/invoices.json"
    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(3)
  end

  it "shows a single invoice" do
    invoice = create(:invoice, status: "shipped")
    get "/api/v1/invoices/#{invoice.id}"
    raw_invoice = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(raw_invoice["status"]).to eq("shipped")
  end
end
