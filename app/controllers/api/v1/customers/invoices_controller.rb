class Api::V1::Customers::InvoicesController < ApplicationController
  def index
    @invoices = Customer.find(params[:id]).invoices
  end
end
