require "rails_helper"

RSpec.describe "Merchants Return Top Items" do
  it "returns top merchants ranked by total number of items" do
    merchant1 = create(:merchant, name: 'Apple')
    merchant2 = create(:merchant, name: 'IBM')
    merchant3 = create(:merchant, name: 'Dell')
    merchant4 = create(:merchant, name: 'HP')

    create_list(:item, 10, merchant_id: merchant1.id)
    create_list(:item, 15, merchant_id: merchant2.id)
    create_list(:item, 12, merchant_id: merchant3.id)

    get "/api/v1/merchants/most_items", quantity: 3
    top_merchants = JSON.parse(response.body)
    require 'pry'; binding.pry
    expect(top_merchants[0]["id"]).to eq(merchant2.id)
  end

end
