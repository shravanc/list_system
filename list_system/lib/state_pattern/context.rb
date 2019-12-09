class Context
attr_accessor :state

def initialize state
  transition_to(state)
end

def transition_to(state)
  @state = state
  @state.context = self
end

def published
  @state.publish
end

def unpublished
  @state.unpublish
end




end
