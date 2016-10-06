class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices

  def total_revenue
    transactions.joins('INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id')
                .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def total_revenue_for_date(date)
     transactions.where('invoices.created_at = ?', date.to_datetime.utc).joins('INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id').sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def self.most_items(quantity)
    joins(:items).select('merchants.id, merchant_id, count(items.id) as count').limit("#{quantity}").group('merchants.id, merchant_id').order('count desc')
  end

end
