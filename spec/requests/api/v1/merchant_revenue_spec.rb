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

      single_merchant_revenue = merchant.total_revenue
      expect(single_merchant_revenue).to eq(9050)
    end

    it "returns total revenue for a specific invoice date" do
      create(:customer)
      merchant = create(:merchant, name: 'Apple', id: 1)
      create(:item, id: 1, unit_price: 3000, merchant_id: 1)
      create(:item, id: 2, unit_price: 3050, merchant_id: 1)
      invoice = create(:invoice, created_at: "2012-03-27 14:53:59 UTC", merchant_id: 1, id: 1)
      create(:invoice_item, item_id: 1, invoice_id: 1, unit_price: 3000, quantity: 2)
      create(:invoice_item, item_id: 2, invoice_id: 1, unit_price: 3050, quantity: 1)
      create(:transaction, invoice_id: 1)

      get "/api/v1/merchants/#{merchant.id}/revenue?date=#{invoice.created_at}"

      day_revenue = merchant.total_revenue_for_date(invoice.created_at)
      expect(day_revenue).to eq(9050)
    end
  end
