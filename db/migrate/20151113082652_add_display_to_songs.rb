class AddDisplayToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :display, :integer
  end
end
