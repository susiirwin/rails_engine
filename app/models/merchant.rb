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

  def self.most_items(quantity)
    # joins(:items).select("merchants.id, count(items.id) item_count from merchants inner join items on merchant.id = items.merchant_id order by item_count desc group by merchants.id limit #{quantity}")

    # # this is for inspiration, it returns counts not merchants - we need the Merchant Object to be returned
    # # check into AR .select to make this work (not the block version)
    joins(:items).order("count(items.id) desc").limit(quantity)
    # .count("items.id")
  end

end
