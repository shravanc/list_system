class AppsController < ApplicationController
    def index
        render json: {apps: App.all.as_json}
      end
  
      def create
        app = App.new
        status, data = app.create(params)
        if status
          render json: data, status: :unprocessable_entity
        else
          render json: data, status: :created
        end
      end
end
