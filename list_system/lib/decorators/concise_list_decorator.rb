class ConciseListDecorator < Decorator

def decorate
  return {only: list_attributes, include: associated_model_attributes }
end

private
def associated_model_attributes
  m = MediumAttributes.new
  l = LayoutAttributes.new
  i = ItemAttributes.new
  s = SublistAttributes.new
  return ShowFacade.new(m, l, i, s).show_attributes
end

def list_attributes
  [:id, :title, :slug, :description]
end


end
