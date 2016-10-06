class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    @transactions = Invoice.find(params[:id]).transactions
  end
end
