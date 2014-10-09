class CreateGenreLanguages < ActiveRecord::Migration
  def change
    create_table :genre_languages do |t|
      t.string :name

      t.timestamps
    end
  end
end
