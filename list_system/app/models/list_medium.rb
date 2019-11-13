class ListMedium < ApplicationRecord
  belongs_to :medium
  belongs_to :list
  validates_uniqueness_of :list, uniqueness: {scope: :medium}
end
