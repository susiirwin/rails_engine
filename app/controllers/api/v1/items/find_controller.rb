class Api::V1::Items::FindController < ApplicationController
  def show
    price_check
    @item = Item.unscoped.find_by(item_params)
  end

  def index
    @items = Item.where(item_params)
  end

  private
  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
