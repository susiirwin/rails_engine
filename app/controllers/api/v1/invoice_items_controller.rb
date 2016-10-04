class Api::V1::InvoiceItemsController < ApplicationController
  def index
    render json: Invoiceitem.all
  end

  def show
    render json: Invoiceitem.find(params[:id])
  end

end
