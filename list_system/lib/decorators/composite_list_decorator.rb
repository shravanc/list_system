class CompositeListDecorator < Decorator

def decorate
  return {only: list_attributes, include: associated_model_attributes }
end

private
def associated_model_attributes
  m = MediumAttributes.new
  l = LayoutAttributes.new
  i = ItemAttributes.new
  s = SublistAttributes.new
  return IndexFacade.new(m, l, i, s).index_attributes
end

def list_attributes
  [:id, :title, :slug, :description]
end


end
