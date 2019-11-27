class Layout < ApplicationRecord
has_many :list_layouts
has_many :lists, through: :list_layouts

#callbacks
before_create :set_slug

def index
  { layouts: Layout.all.as_json(only: layouts_attributes ) }
end

def create params
  layout = Layout.new(params[:layout].as_json)
  layout.save

  message = { message: 'layout created succesfully'}
  return [ true, message ]

end

private
def layouts_attributes
  [:id, :title]
end


end
