json.array! @transactions do |transaction|
  json.id transaction.id
  json.invoice_id transaction.invoice_id
  json.credit_card_number transaction.credit_card_number
  json.credit_card_expiration_date transaction.credit_card_expiration_date
end
