require 'rails_helper'

describe "transactions finders" do
  it "returns transaction by credit_card_number" do
    transaction = create(:transaction, credit_card_number: "1234")
    get "/api/v1/transactions/find?credit_card_number=1234"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["credit_card_number"]).to eq("1234")
  end

  it "returns transaction by id" do
    transaction = create(:transaction, id: 1)
    get "/api/v1/transactions/find?id=1"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["id"]).to eq(1)
  end

  it "returns all transactions by credit_card_number" do
    transactions = 2.times {create(:transaction, credit_card_number: "1234")}
    get "/api/v1/transactions/find_all?credit_card_number=1234"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find.count).to eq(2)
  end
end
