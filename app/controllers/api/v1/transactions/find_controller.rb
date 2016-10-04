class Api::V1::Transactions::FindController < ApplicationController
  def show
    if transaction_params.keys.first == "result"
      render json: Transaction.find_by("lower(#{transaction_params.keys.first}) = ?", params[transaction_params.keys.first].downcase)
    else
      render json: Transaction.find_by(transaction_params)
    end
  end

  def index
    if transaction_params.keys.first == "result"
      render json: Transaction.where("lower(#{transaction_params.keys.first}) = ?", params[transaction_params.keys.first].downcase)
    else
      render json: Transaction.where(transaction_params)
    end
  end

  private
  def transaction_params
    params.permit(:id, :credit_card_number, :result, :created_at, :updated_at)
  end
end
