json.array! @invoice_items do |invoice_item|
  json.id invoice_item.id
  json.item_id invoice_item.item_id
  json.invoice_id invoice_item.invoice_id
  json.quantity invoice_item.quantity
  json.unit_price (invoice_item.unit_price.to_f / 100).to_s
end
