class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices

  def single_merchant_revenue
    total_revenue = self.transactions.joins('INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id').sum('invoice_items.unit_price * invoice_items.quantity')

    total_revenue.to_f/100
  end

end
