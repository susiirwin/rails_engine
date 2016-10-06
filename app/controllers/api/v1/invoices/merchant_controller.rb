class Api::V1::Invoices::MerchantController < ApplicationController

  def show
    @merchant = Invoice.find(params[:id]).merchant
  end
end
