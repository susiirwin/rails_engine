class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices

  def total_revenue
    transactions.joins('INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id')
                .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def total_revenue_for_date(date)
     transactions.where('invoices.created_at = ?', date).joins('INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id').sum('invoice_items.unit_price * invoice_items.quantity')
  end

end
