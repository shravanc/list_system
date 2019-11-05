class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title, default: ""
      t.string :description, default: ""
      t.string :slug, default: ""

      t.timestamps
    end
  end
end
