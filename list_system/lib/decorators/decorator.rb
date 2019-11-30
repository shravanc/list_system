class Decorator < Component
  attr_accessor :component

  def initialize(component)
    @component = component
  end

  def opertion
    @component.operation
  end

end
