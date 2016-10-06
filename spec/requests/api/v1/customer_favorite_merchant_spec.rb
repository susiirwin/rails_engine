# RSpec.describe "Customer Business Intelligence" do
#     it "returns merchant where customer has most succesful transactions" do
#       customer = create(:customer, id: 1)
#       merchant = create(:merchant, name: 'Apple', id: 1)
#       create(:merchant, name: 'Google', id: 2)
#       create(:merchant, name: 'Microsoft', id: 3)
#       create(:invoice, id: 1, customer_id: 1, merchant_id: 3)
#       create(:invoice, id: 2, customer_id: 1, merchant_id: 2)
#       create(:invoice, id: 3, customer_id: 1, merchant_id: 1)
#       create(:invoice, id: 4, customer_id: 1, merchant_id: 1)
#       create(:transaction, invoice_id: 1, result: 'success')
#       create(:transaction, invoice_id: 2, result: 'success')
#       create(:transaction, invoice_id: 3, result: 'success')
#       create(:transaction, invoice_id: 4, result: 'success')
#
#       get "/api/v1/customers/#{customer.id}/favorite_merchant"
#       # byebug
#       favorite_merchant = JSON.parse(response.body)
#       # byebug
#       expect(favorite_merchant["id"]).to eq(merchant.id)
#       expect(favorite_merchant["name"]).to eq(merchant.name)
#     end
#   end
