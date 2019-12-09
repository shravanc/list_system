class IndexComponent < Component

def decorate
  return {only: list_attributes}
end

private
def list_attributes
  [:id, :title, :slug, :description]
end

end
