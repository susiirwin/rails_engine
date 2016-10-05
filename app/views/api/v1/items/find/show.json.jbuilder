json.id @item.id
json.name @item.name
json.description @item.description
json.merchant_id @item.merchant_id
json.unit_price (@item.unit_price.to_f / 100).to_s
