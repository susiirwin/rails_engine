require 'rails_helper'

describe "items finders" do
  it "returns item by name" do
    item = create(:item, name: "Book")
    get "/api/v1/items/find?name=Book"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["name"]).to eq("Book")
  end

  it "returns item by case insensitive name" do
    item = create(:item, name: "computer")
    get "/api/v1/items/find?name=COMputER"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["name"]).to eq("computer")
  end

  it "returns item by id" do
    item = create(:item, id: 1)
    get "/api/v1/items/find?id=1"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["id"]).to eq(1)
  end

  # it "returns item by created_at" do
  #   item = create(:item, created_at: "2012-03-27 14:53:59 UTC")
  #   get "/api/v1/items/find?created_at=2012-03-27 14:53:59 UTC"
  #   result_find = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(result_find["created_at"]).to eq(item.created_at)
  # end

  # it "returns item by updated_at" do
  #   item = create(:item, updated_at: 1)
  #   get "/api/v1/items/find?updated_at=1"
  #   result_find = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(result_find["updated_at"]).to eq(1)
  # end

  it "returns all items by name" do
    items = 2.times {create(:item, name: "eBay")}
    get "/api/v1/items/find_all?name=eBay"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find.count).to eq(2)
  end

  it "returns all items by name case insensitive" do
    items = 2.times {create(:item, name: "Saucony")}
    get "/api/v1/items/find_all?name=SAUConY"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find.count).to eq(2)
  end
end
