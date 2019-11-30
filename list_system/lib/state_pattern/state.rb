class State
attr_accessor :context

def published
  raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
end

def unpublished
  raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
end

end
