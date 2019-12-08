class State
attr_accessor :context

def publish
  raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
end

def unpublish
  raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
end

end
