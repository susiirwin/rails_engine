class Api::V1::Items::FindController < ApplicationController
  def show
    if item_params.keys.first == "name"
      render json: Item.find_by("lower(#{item_params.keys.first}) = ?", params[item_params.keys.first].downcase)
    elsif item_params.keys.first == "description"
      render json: Item.find_by("lower(#{item_params.keys.first}) = ?", params[item_params.keys.first].downcase)
    else
      render json: Item.find_by(item_params)
    end
  end

  def index
    if item_params.keys.first == "name"
      render json: Item.where("lower(#{item_params.keys.first}) = ?", params[item_params.keys.first].downcase)
    elsif item_params.keys.first == "description"
      render json: Item.find_by("lower(#{item_params.keys.first}) = ?", params[item_params.keys.first].downcase)
    else
      render json: Item.where(item_params)
    end
  end

  private
  def item_params
    params.permit(:id, :name, :description, :created_at, :updated_at)
  end
end
