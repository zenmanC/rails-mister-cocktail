class AddCocktailpicToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :photo2, :string
  end
end
