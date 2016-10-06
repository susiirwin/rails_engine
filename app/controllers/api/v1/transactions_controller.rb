class Api::V1::TransactionsController < ApplicationController
  def index
    @transactions = Transaction.unscoped.all
  end

  def show
    @transaction = Transaction.unscoped.find(params[:id])
  end
end
