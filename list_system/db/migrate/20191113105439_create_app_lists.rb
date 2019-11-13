class CreateAppLists < ActiveRecord::Migration[5.2]
  def change
    create_table :app_lists do |t|
      t.integer :app_id
      t.integer :list_id
      t.integer :number, default: 0
      t.integer :app_list_count, default: 0

      t.timestamps
    end
  end
end
