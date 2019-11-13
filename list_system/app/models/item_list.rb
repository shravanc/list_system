class ItemList < ApplicationRecord
  belongs_to :item#, :counter_cache => true
  belongs_to :list#, :counter_cache => true
  validates_uniqueness_of :item_id, :scope => :list_id #uniqueness: { scope: :list }
end
