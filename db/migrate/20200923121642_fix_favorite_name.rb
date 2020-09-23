class FixFavoriteName < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :favourite, :favorite?
  end
end
