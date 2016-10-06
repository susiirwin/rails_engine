class Transaction < ApplicationRecord
  belongs_to :invoice
  has_many :invoice_items, through: :invoice
  # default_scope { where(result: 'success') }
  scope :pending, -> { where(result: 'failed')}
  scope :success, -> { where(result: 'success')}
end
