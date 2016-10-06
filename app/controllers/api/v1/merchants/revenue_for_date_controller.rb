class Api::V1::Merchants::RevenueForDateController < ApplicationController

  def show
    render json: Merchant.total_revenue_for_date(params[:created_at])
  end

  # private
  # def merchant_params
  #   params.permit(:id, :name, :created_at, :updated_at)
  # end
end
