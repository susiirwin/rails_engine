class Api::V1::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
    # render json: Merchant.all
  end

  def show
    render json: Merchant.find(params[:id])
  end
end
