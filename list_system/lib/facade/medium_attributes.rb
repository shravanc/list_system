class MediumAttributes

def index_attributes
  return {media: {only: [:id, :title, :slug, :url]}}
end

def show_attributes
  return {media: {only: [:id, :title, :slug, :url]}}
end

end
