class CreateItemMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :item_media do |t|
      t.integer :item_id
      t.integer :medium_id
      t.integer :numbder, default: 0
      t.string :description, default: ""

      t.timestamps
    end
  end
end
