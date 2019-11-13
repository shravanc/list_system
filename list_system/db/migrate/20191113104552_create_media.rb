class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :title, default: ""
      t.string :description, default: ""
      t.string :url, default: ""
      t.string :media_type, default: ""
      t.string :slug, default: ""

      t.timestamps
    end
  end
end
