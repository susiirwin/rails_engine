require 'rails_helper'

describe "invoices finders" do
  it "returns invoice by status" do
    invoice = create(:invoice, status: "shipped")
    get "/api/v1/invoices/find?status=shipped"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["status"]).to eq("shipped")
  end

  it "returns invoice by case insensitive status" do
    invoice = create(:invoice, status: "shipped")
    get "/api/v1/invoices/find?status=SHiPPed"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["status"]).to eq("shipped")
  end

  it "returns invoice by id" do
    invoice = create(:invoice, id: 1)
    get "/api/v1/invoices/find?id=1"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["id"]).to eq(1)
  end

  it "returns all invoices by status" do
    invoices = 2.times {create(:invoice, status: "shipped")}
    get "/api/v1/invoices/find_all?name=shipped"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find.count).to eq(2)
  end

  it "returns all invoices by status case insensitive" do
    invoices = 2.times {create(:invoice, status: "shipped")}
    get "/api/v1/invoices/find_all?name=SHippED"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find.count).to eq(2)
  end
end
