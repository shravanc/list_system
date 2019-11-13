class CreateLayouts < ActiveRecord::Migration[5.2]
  def change
    create_table :layouts do |t|
      t.string :title, default: ""
      t.string :description, default: ""
      t.string :limit, default: 0
      t.string :slug, default: ""

      t.timestamps
    end
  end
end
