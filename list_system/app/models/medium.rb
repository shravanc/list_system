class Medium < ApplicationRecord
  has_many :item_media
  has_many :items, through: :item_media

  has_many :list_media
  has_many :lists, through: :list_media

  #callbacks
  before_create :set_slug

  def medium_attributes
    return [:id, :title]
  end

  def index
    { media: List.all.as_json(only: medium_attributes) }
  end

  def create params
    medium = Medium.new(params[:medium].as_json)
    medium.save

    message = { message: 'Medium created succesfully'}
    return [ true, message ]

  end

  def update params
    medium = Medium.find(params[:id])
    medium.update_attributes(params[:medium].as_json)

    message = { message: 'Medium updated succesfully'}
    return [ true, message ]
  end

end
