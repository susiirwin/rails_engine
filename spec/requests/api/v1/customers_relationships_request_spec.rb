require 'rails_helper'

describe "customers relationships" do
  it "returns a collection of associated invoices" do
    customer = create(:customer)
    invoice = create(:invoice, id: 1, customer_id: customer.id)
    invoice = create(:invoice, id: 2, customer_id: customer.id)
    invoice = create(:invoice, id: 3, customer_id: customer.id)
    invoice = create(:invoice, id: 4, customer_id: customer.id)

    get "/api/v1/customers/#{customer.id}/invoices"
    # byebug
    invoices = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(invoices.count).to eq(4)
  end
end
