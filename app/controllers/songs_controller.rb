class SongsController < ApplicationController

  def show
    @song = Song.find(params[:id])
  end

  def search
    @songs = Song.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

end
