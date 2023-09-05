class AddArtistNameToPhrases < ActiveRecord::Migration[7.0]
  def change
    add_column :phrases, :artist_name, :string
  end
end
