class RemoveArtistIdFromCalls < ActiveRecord::Migration
  def change
    remove_column :calls, :artist_id, :integer
  end
end
