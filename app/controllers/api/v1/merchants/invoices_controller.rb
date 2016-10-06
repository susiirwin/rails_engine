class Api::V1::Merchants::InvoicesController < ApplicationController
  def index
    @invoices = Merchant.find(params[:id]).invoices
  end
end
