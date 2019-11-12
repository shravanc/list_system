class ItemsController < ApplicationController

  def index 
    render json: Item.new.index
  end

  def show
    render json: Item.new.show(params)
  end

  def create
    item = Item.new
    status, data = item.create(params)
    if status
      render json: data, status: :created
    else
      render json: data, status: :unprocessable_entity
    end
  end

  def update
    item = Item.new
    status, data = item.update(params)
    if status
      render json: data, status: :ok
    else
      render json: data, status: :unprocessable_entity
    end
  end
end
