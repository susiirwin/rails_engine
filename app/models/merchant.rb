class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def total_revenue
    transactions.merge(Transaction.success).joins('INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id')
                .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def total_revenue_for_date(date)
     transactions.where('invoices.created_at = ?', date.to_datetime.utc).joins('INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id').sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def self.most_items(quantity)
    joins(:items).select('merchants.id, merchant_id, count(items.id) as count').limit("#{quantity}").group('merchants.id, merchant_id').order('count desc')
  end

  def favorite_customer
    transactions.select('invoices.customer_id, COUNT(transactions.id) AS transactions_count')
                     .merge(Transaction.success)
                     .group('invoices.customer_id')
                     .order('transactions_count DESC')
                     .limit(1)
  end

  def customers_with_pending_invoices
    customers.joins(:transactions).distinct.merge(Transaction.pending)
    # customers.joins(:transactions).distinct
    #          .where(transactions: {result: failed})
    # customers.joins("join transactionss on transactions.invoice.id = invoice.id")
  end

  # "select distinct on (customers.id) customers.* from customers inner join invoices on invoices.customer_id = customer.id inner join transactions on transactions.invoice_id = invoices.id where invoices.merchant_id = 17 and transactions.result = 'failed'"

end
