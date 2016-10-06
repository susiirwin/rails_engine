class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def show
    @favorite_customer =  Merchant.find_by(merchant_params).favorite_customer
  end
  private
  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
