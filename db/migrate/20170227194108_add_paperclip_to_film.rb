class AddPaperclipToFilm < ActiveRecord::Migration[5.0]
  def change
    add_attachment :films, :image
  end
end
