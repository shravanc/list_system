class CreateListLayouts < ActiveRecord::Migration[5.2]
  def change
    create_table :list_layouts do |t|
      t.integer :list_id
      t.integer :layout_id

      t.timestamps
    end
  end
end
