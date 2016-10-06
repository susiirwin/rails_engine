class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  def show
    @favorite_merchant =  Customer.find_by(customer_params).favorite_merchant
  end
  private
  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
