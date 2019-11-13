class Item < ApplicationRecord

  has_many :item_lists
  has_many :lists, -> { disctinct }, through: :item_lists

  has_many :item_media
  has_many :media, through: :item_media

  has_many :app_items
  has_many :apps, -> { disctinct }




end
