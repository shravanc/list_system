class SublistAttributes

def index_attributes
  return {sublists: {only: list_attributes , include: [ layouts_attributes ] } }
end

def show_attributes
  return {sublists: {only: list_attributes , include: [ layouts_attributes ] } }
end

private

def list_attributes
  [:id, :title, :slug, :description]
end

def layouts_attributes
  { layouts: { only: [:id, :title, :slug]}}
end

end
