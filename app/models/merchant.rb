class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  def single_merchant_revenue
    Merchant.find(id)
  end

end
