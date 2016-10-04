class Api::V1::Merchants::FindController < ApplicationController
  def show
    if merchant_params.keys.first == "name"
      render json: Merchant.find_by("lower(#{merchant_params.keys.first}) = ?", params[merchant_params.keys.first].downcase)
    else
      render json: Merchant.find_by(merchant_params)
    end
  end

  def index
    if merchant_params.keys.first == "name"
      render json: Merchant.where("lower(#{merchant_params.keys.first}) = ?", params[merchant_params.keys.first].downcase)
    else
      render json: Merchant.where(merchant_params)
    end
  end

  private
  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
