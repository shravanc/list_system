class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.integer :list_id
      t.integer :sublist_id
      t.integer :number, default: 0

      t.timestamps
    end
  end
end
