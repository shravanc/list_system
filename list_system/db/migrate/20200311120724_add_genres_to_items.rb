class AddGenresToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :genres, :integer, array: true, default: []
  end
end
