require 'rails_helper'

describe "invoices finders" do
  it "returns invoice by status" do
    invoice = create(:invoice, status: "shipped")
    get "/api/v1/invoices/find?name=shipped"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["status"]).to eq("shipped")
  end

  it "returns invoice by case insensitive status" do
    invoice = create(:invoice, status: "shipped")
    get "/api/v1/invoices/find?name=SHiPPed"
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

  # it "returns invoice by created_at" do
  #   invoice = create(:invoice, created_at: "2012-03-27 14:53:59 UTC")
  #   get "/api/v1/invoices/find?created_at=2012-03-27 14:53:59 UTC"
  #   result_find = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(result_find["created_at"]).to eq(invoice.created_at)
  # end

  # it "returns invoice by updated_at" do
  #   invoice = create(:invoice, updated_at: 1)
  #   get "/api/v1/invoices/find?updated_at=1"
  #   result_find = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(result_find["updated_at"]).to eq(1)
  # end

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
