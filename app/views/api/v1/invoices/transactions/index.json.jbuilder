json.array! @transactions do |transaction|
  json.id transaction.id
  json.invoice_id transaction.invoice_id
  json.credit_card_number transaction.credit_card_number
  json.result transaction.result
end
