require 'rails_helper'

describe "invoices relationships" do
  it "returns a collection of associated transactions" do
    invoice = create(:invoice, id: 1)
    create(:transaction, invoice_id: 1)
    create(:transaction, invoice_id: 1)
    create(:transaction, invoice_id: 1)

    get "/api/v1/invoices/#{invoice.id}/transactions"
    transactions = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(transactions.count).to eq(3)
  end

  it "returns a collection of associated invoice items" do
    invoice = create(:invoice, id: 2)
    create(:invoice_item, invoice_id: 2)
    create(:invoice_item, invoice_id: 2)
    create(:invoice_item, invoice_id: 2)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"
    invoice_items = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoice_items.count).to eq(3)
  end

  it "returns the associated customer" do
    create(:customer, id: 1, first_name: "Sally")
    create(:customer, id: 2, first_name: "Josh")
    invoice = create(:invoice, id: 2, customer_id: 1)

    get "/api/v1/invoices/#{invoice.id}/customer"

    customers = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(customers["first_name"]).to eq("Sally")
  end

  it "returns the associated merchant" do
    create(:merchant, id: 1, name: "Apple")
    create(:merchant, id: 2, name: "IBM")
    invoice = create(:invoice, id: 2, merchant_id: 1)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    merchants = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(merchants["name"]).to eq("Apple")

  end
end
