require 'rails_helper'

describe "customers crud api" do
  it "returns a list of customers" do
    create_list(:customer, 3)
    get "/api/v1/customers.json"
    customers = JSON.parse(response.body)
    expect(response).to be_success
    expect(customers.count).to eq(3)
  end

  it "returns a single customer" do
    customer = create(:customer, first_name: "Dan")
    get "/api/v1/customers/#{customer.id}.json"
    raw_customer = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(raw_customer["first_name"]).to eq("Dan")
  end
end
