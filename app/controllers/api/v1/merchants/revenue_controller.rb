class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    render json: Merchant.find_by(merchant_params).total_revenue
  end

  private
  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
