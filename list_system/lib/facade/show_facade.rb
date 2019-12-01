class ShowFacade

def initialize(medias, layouts, items)
  @medias = medias
  @layouts = layouts
  @items = items
end

def show_attributes
  attributes = []
  attributes << @medias.index_attributes
  attributes << @layouts.index_attributes
  attributes << @items.index_attributes
  return attributes
end

end
