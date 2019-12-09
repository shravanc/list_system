class List < ApplicationRecord

  has_many :item_lists
  has_many :items, -> { order('item_lists.number') }, through: :item_lists

  has_many :list_layouts
  has_many :layouts, -> { distinct }, through: :list_layouts

  has_many :list_media
  has_many :media, through: :list_media

  has_many :app_lists
  has_many :apps, through: :app_lists

  #self associations
  has_many :collections
  has_many :sublists, ->{order 'collections.number'}, through: :collections
  has_many :inverse_collections, :class_name => "collections", :foreign_key => "sublist_id"
  has_many :inverse_sublists, :through => :inverse_collections, :source => :list


  #callbacks
  before_create :set_slug

#GET

  def list_attributes
    [:id, :title, :slug, :description]
  end

  def show params
    list = List.find(params[:id])
    list.as_json( show_decorator.decorate )
  end

  def index
    { lists: List.all.as_json( index_decorator.decorate ) }
  end

#POST
  def create params
    list = List.new(params[:list].as_json)
    list.save

    message = { message: 'list created succesfully'}
    return [ true, message ]

  end

#PUT
  def update params
    list = List.find(params[:id])

    list.update_attributes(params.require(:list).permit([:title, :description]))

    item_data   = params.require(:list).permit([ items: [:item_id, :number] ])["items"]
    layout_data = params.require(:list).permit([ layouts: []])["layouts"]
    media_data  = params.require(:list).permit([ media: []])["media"]
    sublist_data = params.require(:list).permit([ sublists: []])["sublists"]

    if item_data
      item_lists_params = item_data.map{|a1| {item_id: a1["item_id"], list_id: list.id, number: a1["number"]} }
      list.item_lists.create(item_lists_params)
    end

    if layout_data
      list_layouts_params = layout_data.map{|la| {layout_id: la, list_id: list.id}}
      list.list_layouts.create(list_layouts_params)
    end

    if media_data
      list_medium_params = media_data.map{|m| {medium_id: m, list_id: list.id}}
      list.list_media.create(list_medium_params)
    end

    if sublist_data
      sublist_data_params = sublist_data.map{|s| {sublist_id: s, list_id: list.id}}
      list.collections.create(sublist_data_params)
    end
    message = {message: 'list updated succesfully'}
    return [true, message]
  end

  private

  def get_provider
    return "amazon"
  end

  def index_decorator
    ic = IndexComponent.new
    provider = (get_provider.capitalize + "ListDecorator").constantize
    return provider.new(ic)

  end

  def show_decorator
    ic = ShowComponent.new
    sh = ConciseListDecorator.new(ic)
  end

  def associated_model_attributes
    m = MediaAttributes.new
    l = LayoutAttributes.new
    i = ItemAttributes.new
    s = SublistAttributes.new
    return ShowFacade.new(m, l, i, s)
  end

=begin
  def list_attributes
    [:id, :title, :slug, :description]
  end

  def media_attributes
    {media: {only: [:id, :title, :slug, :url]}}
  end

  def layouts_attributes
    { layouts: { only: [:id, :title, :slug]}}
  end

  def items_attributes
    { items: {only: [:id, :title, :slug, :description], include: [ media_attributes ] } }
  end

  def sublists_attributes
    {sublists: {only: list_attributes , include: [ layouts_attributes ] } }
  end
=end

end
