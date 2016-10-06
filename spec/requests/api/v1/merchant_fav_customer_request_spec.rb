require 'rails_helper'

RSpec.describe "Merchant Business Intelligence" do
    it "returns customer with most succesful transactions" do
      customer_1 = create(:customer, id: 1)
      customer_2 = create(:customer, id: 2)
      merchant = create(:merchant, name: 'Apple', id: 1)
      create(:invoice, id: 1, customer_id: 1, merchant_id: 1)
      create(:invoice, id: 2, customer_id: 1, merchant_id: 1)
      create(:invoice, id: 3, customer_id: 1, merchant_id: 1)
      create(:invoice, id: 4, customer_id: 2, merchant_id: 1)
      create(:transaction, invoice_id: 1, result: 'success')
      create(:transaction, invoice_id: 2, result: 'success')
      create(:transaction, invoice_id: 3, result: 'success')
      create(:transaction, invoice_id: 4, result: 'success')

      get "/api/v1/merchants/#{merchant.id}/favorite_customer"
      # byebug
      favorite_customer = JSON.parse(response.body)
      # byebug
      expect(favorite_customer["id"]).to eq(customer_1.id)
    end

    it "returns a collection of customers with pending invoices" do
      merchant = create(:merchant, name: 'Apple', id: 1)
      create(:customer, id: 1)
      create(:customer, id: 2)
      create(:customer, id: 3)
      create(:invoice, id: 1, customer_id: 1, merchant_id: 1)
      create(:invoice, id: 2, customer_id: 2, merchant_id: 1)
      create(:invoice, id: 3, customer_id: 3, merchant_id: 1)
      create(:transaction, invoice_id: 1, result: 'failed')
      create(:transaction, invoice_id: 2, result: 'failed')
      create(:transaction, invoice_id: 3, result: 'success')

      get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

      unpaid_customers = JSON.parse(response.body)
      expect(unpaid_customers.count).to eq(2)
    end
  end
