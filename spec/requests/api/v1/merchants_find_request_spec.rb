require 'rails_helper'

describe "merchants finders" do
  it "returns merchant by name" do
    merchant = create(:merchant, name: "Apple")
    get "/api/v1/merchants/find?name=Apple"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["name"]).to eq("Apple")
  end

  it "returns merchant by case insensitive name" do
    merchant = create(:merchant, name: "apple")
    get "/api/v1/merchants/find?name=APPlE"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["name"]).to eq("apple")
  end

  it "returns merchant by id" do
    merchant = create(:merchant, id: 1)
    get "/api/v1/merchants/find?id=1"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["id"]).to eq(1)
  end

  # it "returns merchant by created_at" do
  #   merchant = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")
  #   get "/api/v1/merchants/find?created_at=2012-03-27 14:53:59 UTC"
  #   result_find = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(result_find["created_at"]).to eq(merchant.created_at)
  # end

  # it "returns merchant by updated_at" do
  #   merchant = create(:merchant, updated_at: 1)
  #   get "/api/v1/merchants/find?updated_at=1"
  #   result_find = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(result_find["updated_at"]).to eq(1)
  # end

  it "returns all merchants by name" do
    merchants = 2.times {create(:merchant, name: "Microsoft")}
    get "/api/v1/merchants/find_all?name=Microsoft"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find.count).to eq(2)
  end

  it "returns all merchants by name case insensitive" do
    merchants = 2.times {create(:merchant, name: "Microsoft")}
    get "/api/v1/merchants/find_all?name=MicRosOft"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find.count).to eq(2)
  end
end
