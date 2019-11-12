class ListsController < ApplicationController

    def index
      render json: List.new.index
    end

    def show
      render json: List.new.show(params)
    end

    def create
      list = List.new
      status, data = list.create(params)
      if status
        render json: data, status: :created
      else
        render json: data, status: :unprocessable_entity
      end
    end

    def update
      list = List.new
      status, data = list.update(params)
      if status
        render json: data, status: :ok
      else
        render json: data, status: :unprocessable_entity
      end
    end

end
