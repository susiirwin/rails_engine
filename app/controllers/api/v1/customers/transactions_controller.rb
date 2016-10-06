class Api::V1::Customers::TransactionsController < ApplicationController
  def index
    @transactions = Customer.find(params[:id]).transactions
  end
end
