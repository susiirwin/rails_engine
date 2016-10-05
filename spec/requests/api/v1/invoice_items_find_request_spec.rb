require 'rails_helper'

describe "invoice items finders" do
  it "returns invoice item by quantity" do
    invoice_item = create(:invoice_item, quantity: 23)
    get "/api/v1/invoice_items/find?quantity=23"
    result_find = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(result_find["quantity"]).to eq(23)
  end

  it "returns item by id" do
    invoice_item = create(:invoice_item, id: 1)
    get "/api/v1/invoice_items/find?id=1"
    result_find = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(result_find["id"]).to eq(1)
  end

  # it "returns item by created_at" do
  #   item = create(:item, created_at: "2012-03-27 14:53:59 UTC")
  #   get "/api/v1/invoice_items/find?created_at=2012-03-27 14:53:59 UTC"
  #   result_find = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(result_find["created_at"]).to eq(item.created_at)
  # end

  # it "returns item by updated_at" do
  #   item = create(:item, updated_at: 1)
  #   get "/api/v1/invoice_items/find?updated_at=1"
  #   result_find = JSON.parse(response.body)
  #   expect(response.status).to eq(200)
  #   expect(result_find["updated_at"]).to eq(1)
  # end

  it "returns all invoice items by quantity" do
    invoice_items = 2.times {create(:invoice_item, quantity: 43)}
    get "/api/v1/invoice_items/find_all?quantity=43"
    result_find = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(result_find.count).to eq(2)
  end

  it "returns one invoice items by unit price" do
    invoice_item = create(:invoice_item, unit_price: 299)
    get "/api/v1/invoice_items/find?unit_price=2.99"
    result_find = JSON.parse(response.body)
    # byebug
    expect(response.status).to eq(200)
    expect(result_find["unit_price"]).to eq("2.99")
  end

end
