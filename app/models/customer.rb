class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def result
    transactions.select('invoices.merchant_id, COUNT(transactions.id) AS transactions_count')
                     .merge(Transaction.success)
                     .group('invoices.merchant_id')
                     .order('transactions_count DESC')
                     .limit(1)
  end

  def merchant_id
    result[0]['merchant_id']
  end

  def favorite_merchant
    Merchant.find(merchant_id)
  end
end
