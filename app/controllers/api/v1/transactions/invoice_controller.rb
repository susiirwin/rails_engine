class Api::V1::Transactions::InvoiceController < ApplicationController

  def show
    @invoice = Transaction.find(params[:id]).invoice
  end
end
