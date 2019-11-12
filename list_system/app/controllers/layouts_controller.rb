class LayoutsController < ApplicationController
    def index
        render json: Layout.new.index
      end
  
      def create
        layout = Layout.new
        status, data = layout.create(params)
        if status
          render json: data, status: :unprocessable_entity
        else
          render json: data, status: :created
        end
      end
end
