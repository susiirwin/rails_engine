class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  def index
    @invoice = InvoiceItem.find(params[:id]).invoice
  end
end
