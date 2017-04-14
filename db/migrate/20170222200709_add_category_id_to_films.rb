class AddCategoryIdToFilms < ActiveRecord::Migration[5.0]
  def change
    add_column :films, :category_id, :integer
    add_foreign_key :films, :categories 
  end
end
