class Transaction < ApplicationRecord
  belongs_to :invoice
  # default_scope { where(result: 'success') }
end
