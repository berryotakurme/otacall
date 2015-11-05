class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.text :text
      t.string :movie_url
      t.integer :artist_id
      t.integer :song_id
      t.timestamps
    end
  end
end
