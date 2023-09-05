class CreatePhrases < ActiveRecord::Migration[7.0]
  def change
    create_table :phrases do |t|
      t.string :content
      t.string :music_title
      t.text :comment
      t.string :author_name
      t.string :play_url

      t.timestamps
    end
  end
end
