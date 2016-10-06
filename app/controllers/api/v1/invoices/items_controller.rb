class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    @items = Invoice.find(params[:id]).items
  end
end
