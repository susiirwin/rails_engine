class Api::V1::Customers::FindController < ApplicationController
  def show
    if customer_params.keys.first == "first_name"
      render json: Customer.find_by("lower(#{customer_params.keys.first}) = ?", params[customer_params.keys.first].downcase)
    else
      render json: Customer.find_by(customer_params)
    end
  end

  def index
    if customer_params.keys.first == "first_name"
      render json: Customer.where("lower(#{customer_params.keys.first}) = ?", params[customer_params.keys.first].downcase)
    else
      render json: Customer.where(customer_params)
    end
  end

  private
  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
