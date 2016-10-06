require 'rails_helper'

describe "merchants crud api" do
  it "returns a list of merchants" do
    create_list(:merchant, 3)
    get "/api/v1/merchants.json"
    merchants = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchants.count).to eq(3)
  end

  it "returns a single merchant" do
    merchant = create(:merchant, name: "Apple")
    get "/api/v1/merchants/#{merchant.id}.json"
    raw_merchant = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(raw_merchant["name"]).to eq("Apple")
  end
end
