require 'rails_helper'

describe "transactions crud api" do
  it "returns a list of transactions" do
    create_list(:transaction, 3)
    get "/api/v1/transactions.json"
    transactions = JSON.parse(response.body)
    expect(response).to be_success
    expect(transactions.count).to eq(3)
  end

  it "returns a single transaction" do
    transaction = create(:transaction, credit_card_number: "1234")
    get "/api/v1/transactions/#{transaction.id}.json"
    raw_transaction = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(raw_transaction["credit_card_number"]).to eq("1234")
  end
end
