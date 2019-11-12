class MediaController < ApplicationController
    def index
        render json: {media: Medium.all.as_json}
      end
  
      def create
        medium = Medium.new
        status, data = medium.create(params)
        if status
          render json: data, status: :unprocessable_entity
        else
          render json: data, status: :created
        end
      end
  
      def update
        medium = Medium.new
        status, data = medium.update(params)
        if status
          render json: data, status: :unprocessable_entity
        else
          render json: data, status: :created
        end
      end
end
