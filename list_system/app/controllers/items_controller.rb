class ItemsController < ApplicationController

def index
  render json: {data: {items: Item.all.as_json } }, status: :ok
end
end
