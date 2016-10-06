class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    if params['date']
      @merchant = Merchant.find(params[:id]).total_revenue_for_date(params[:date])
    else
      @total_revenue = Merchant.find_by(merchant_params).total_revenue
    end
  end

  private
  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
