class ArtistsController < ApplicationController

  def index
    @artists = Artist.order(id: :asc)
  end

  def show
    @artist = Artist.find(params[:id])
    @songs = @artist.songs.where(display: 1).page(params[:page]).per(20)
  end

end