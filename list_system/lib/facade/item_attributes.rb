class ItemAttributes

def index_attributes
  return { items: {only: [:id, :title, :slug, :description], include: [ media_attributes ] } }
end

def show_attributes
  return { items: {only: [:id, :title, :slug, :description], include: [ media_attributes ] } }
end

private
def media_attributes
  {media: {only: [:id, :title, :slug, :url]}}
end

end
