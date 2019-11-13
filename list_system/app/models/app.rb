class App < ApplicationRecord
  has_many :app_lists
  has_many :lists, through: :app_lists

  has_many :app_items
  has_many :items, through: :app_items

  #callbacks
  before_create :set_slug

  def create params
    app = App.new(params[:app].as_json)
    app.save

    message = { message: 'app created succesfully'}
    return [ true, message ]

  end
end
