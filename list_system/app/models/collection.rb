class Collection < ApplicationRecord
  belongs_to :list
  belongs_to :sublist, :class_name => "List"
end
