class Api::V1::InvoiceItems::FindController < ApplicationController
  def show
    price_check
    @invoice_item = InvoiceItem.find_by(invoice_items_params)
  end

  def index
    price_check
    @invoice_items = InvoiceItem.where(invoice_items_params)
  end

  private

  def invoice_items_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
