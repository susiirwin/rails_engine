class Api::V1::Invoices::FindController < ApplicationController
  def show
    if invoice_params.keys.first == "status"
      render json: Invoice.find_by("lower(#{invoice_params.keys.first}) = ?", params[invoice_params.keys.first].downcase)
    else
      render json: Invoice.find_by(invoice_params)
    end
  end

  def index
    if invoice_params.keys.first == "status"
      render json: Invoice.where("lower(#{invoice_params.keys.first}) = ?", params[invoice_params.keys.first].downcase)
    else
      render json: Invoice.where(invoice_params)
    end
  end

  private
  def invoice_params
    params.permit(:id, :status, :created_at, :updated_at)
  end
end
