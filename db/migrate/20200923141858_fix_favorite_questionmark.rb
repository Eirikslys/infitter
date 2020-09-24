class FixFavoriteQuestionmark < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :favorite?, :favorite
  end
end
