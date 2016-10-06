class ApplicationController < ActionController::API
  def price_check
    if params['unit_price']
      params['unit_price'] = (params['unit_price'].gsub(".", "")).to_i
    end
  end
end
