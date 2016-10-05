require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "relationships" do
    it { should have_many(:invoices) }
  end

#   context "single merchant revenue" do
#     it "returns total revenue for a single merchant" do
#       create(:customer)
#       merchant = create(:merchant, name: 'Apple')
#       create_list(:item, 3)
#       create_list(:invoice, 4)
#       create_list(:invoice_item, 3)
#       create_list(:transaction, 4)
# byebug
#       single_merchant_revenue = Merchant.select('merchant.name', 'merchant.id').
#                                                 joins(:invoices).
#                                                 where("invoices.merchant_id = ?" , merchant.id).
#                                                 joins(:transactions).
#                                                 where("transactions.invoice_id = ?" , invoice.id)
#       expect(single_merchant_revenue).to eq(1)
#     end
#   end
end
