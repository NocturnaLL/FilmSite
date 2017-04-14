class AddVideoToFilm < ActiveRecord::Migration[5.0]
  def change
    add_attachment :films, :video
  end
end
