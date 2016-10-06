class Api::V1::Merchants::CustomersWithPendingInvoicesController < ApplicationController
  def index
    render json:  Merchant.find_by(merchant_params).customers_with_pending_invoices
  end
  private
  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
