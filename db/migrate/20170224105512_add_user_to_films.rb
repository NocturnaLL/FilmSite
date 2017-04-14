class AddUserToFilms < ActiveRecord::Migration[5.0]
  def change
    add_reference :films, :user, foreign_key: true
  end
end
