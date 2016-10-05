require 'rails_helper'

RSpec.describe "Merchant Business Intelligence" do
    it "returns total revenue for a single merchant" do
      create(:customer)
      merchant = create(:merchant, name: 'Apple', id: 1)
      create(:item, id: 1, unit_price: 3000, merchant_id: 1)
      create(:item, id: 2, unit_price: 3050, merchant_id: 1)
      create(:invoice, merchant_id: 1, id: 1)
      create(:invoice_item, item_id: 1, invoice_id: 1, unit_price: 3000, quantity: 2)
      create(:invoice_item, item_id: 2, invoice_id: 1, unit_price: 3050, quantity: 1)
      create(:transaction, invoice_id: 1)

      get "/api/v1/merchants/#{merchant.id}/revenue"

      single_merchant_revenue = merchant.single_merchant_revenue
      expect(single_merchant_revenue).to eq(90.5)
    end
  end
