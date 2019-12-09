class AmazonIndexFacade

def initialize(medias, layouts, items, sublists)
  @medias = medias
  @layouts = layouts
  @items = items
  @sublists = sublists
end

def index_attributes
  attributes = []
  attributes << @medias.index_attributes
  attributes << @layouts.index_attributes
  attributes << @items.index_attributes
  attributes << @sublists.index_attributes
  return attributes
end

end
