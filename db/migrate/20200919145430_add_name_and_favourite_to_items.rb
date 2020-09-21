class AddNameAndFavouriteToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :name, :string
    add_column :items, :favourite, :boolean, default: false
  end
end
