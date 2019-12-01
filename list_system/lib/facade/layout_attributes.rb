class LayoutAttributes

def index_attributes
  return { layouts: { only: [:id, :title, :slug]}}
end

def show_attributes
  return { layouts: { only: [:id, :title, :slug]}}
end

end
