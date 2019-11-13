class CreateItemLists < ActiveRecord::Migration[5.2]
  def change
    create_table :item_lists do |t|
      t.integer :item_id
      t.integer :list_id
      t.integer :number, default: 0
      t.integer :item_lists_count, default: 0

      t.timestamps
    end
  end
end
