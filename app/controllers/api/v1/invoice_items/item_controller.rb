class Api::V1::InvoiceItems::ItemController < ApplicationController
  def index
    @item = InvoiceItem.find(params[:id]).item
  end
end
