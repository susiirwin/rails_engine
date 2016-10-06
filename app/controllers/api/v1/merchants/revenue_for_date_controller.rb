class Api::V1::Merchants::RevenueForDateController < ApplicationController

  def show
    @merchant = Merchant.find(params[:id])
    render json: @merchant.total_revenue_for_date(params[:date])
  end

end
