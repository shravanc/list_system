class Decorator < Component
  attr_accessor :component

  def initialize(component)
    @component = component
  end

  def decorate
    @component.fetch_all
  end

end
