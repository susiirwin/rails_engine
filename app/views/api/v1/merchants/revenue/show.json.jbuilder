if @merchant
json.revenue (@merchant.to_f / 100).to_s
else
json.revenue (@total_revenue.to_f / 100).to_s
end
