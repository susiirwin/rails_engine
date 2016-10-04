require 'rails_helper'

describe "customers finders" do
  it "returns customer by first_name" do
    customer = create(:customer, first_name: "Dave")
    get "/api/v1/customers/find?first_name=Dave"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["first_name"]).to eq("Dave")
  end

  it "returns customer by case insensitive first_name" do
    customer = create(:customer, first_name: "dave")
    get "/api/v1/customers/find?first_name=daVe"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["first_name"]).to eq("dave")
  end

  it "returns customer by id" do
    customer = create(:customer, id: 1)
    get "/api/v1/customers/find?id=1"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["id"]).to eq(1)
  end

  # it "returns customer by created_at" do
  #   customer = create(:customer, created_at: "2012-03-27 14:53:59 UTC")
  #   get "/api/v1/customers/find?created_at=2012-03-27 14:53:59 UTC"
  #   result_find = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(result_find["created_at"]).to eq(customer.created_at)
  # end

  # it "returns customer by updated_at" do
  #   customer = create(:customer, updated_at: 1)
  #   get "/api/v1/customers/find?updated_at=1"
  #   result_find = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(result_find["updated_at"]).to eq(1)
  # end

  it "returns all customers by first_name" do
    customers = 2.times {create(:customer, first_name: "Dave")}
    get "/api/v1/customers/find_all?first_name=Dave"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find.count).to eq(2)
  end

  it "returns all customers by first_name case insensitive" do
    customers = 2.times {create(:customer, first_name: "dave")}
    get "/api/v1/customers/find_all?first_name=DavE"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find.count).to eq(2)
  end
end
