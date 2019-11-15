class Item < ApplicationRecord

  has_many :item_lists
  has_many :lists, -> { disctinct }, through: :item_lists

  has_many :item_media
  has_many :media, through: :item_media

  has_many :app_items
  has_many :apps, through: :app_items#, -> { distinct }

  #callbacks
  before_create :set_slug

  def show params
    item = Item.find(params[:id])
    item.as_json(only: items_attributes, include: [ media_attributes, apps_attributes] )
  end

  def index
    return { items: Item.all.as_json(only: items_attributes, include: [ media_attributes, apps_attributes] ) }
  end

  def create params
    item = Item.new(params.require(:item).permit([:title, :description]))
    item.save


    apps_data  = params.require(:item).permit([ apps: [] ])["apps"]
    if apps_data
      app_items_params = apps_data.map{|a1| {app_id: a1, item_id: item.id} }
      item.app_items.create(app_items_params)
    end

    media_data = params.require(:item).permit([ media: [] ])["media"]
    if media_data
      item_medium_params = media_data.map{|m| {medium_id: m, item_id: item.id}}
      item.item_media.create(item_medium_params)
    end

    message = { message: 'item created succesfully'}
    return [ true, message ]

  end

  def update params
    item = Item.find(params[:id])
    item.update_attributes(params.require(:item).permit([:title, :description]))
    apps_data  = params.require(:item).permit([ apps: [] ])["apps"]
    media_data = params.require(:item).permit([ media: [] ])["media"]

    if apps_data
      app_items_params = apps_data.map{|a1| {app_id: a1, item_id: item.id} }
      item.app_items.create(app_items_params)
    end

    if media_data
      item_medium_params = media_data.map{|m| {medium_id: m, item_id: item.id}}
      item.item_media.create(item_medium_params)
    end
    return [true, {message: "item updated successfully"}]
  end

  private

  def items_attributes
    [:id, :title, :slug, :description]
  end

  def media_attributes
    {media: {only: [:id, :title, :slug, :url]}}
  end

  def apps_attributes
    {apps: {only: [:id, :title, :slug]}}
  end



end
