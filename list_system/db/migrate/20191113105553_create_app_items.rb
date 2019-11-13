class CreateAppItems < ActiveRecord::Migration[5.2]
  def change
    create_table :app_items do |t|
      t.integer :app_id
      t.integer :item_id
      t.integer :app_items_counts, default: 0

      t.timestamps
    end
  end
end
