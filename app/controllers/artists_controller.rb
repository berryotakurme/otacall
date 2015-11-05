class ArtistsController < ApplicationController

  def index
    @artists = Artist.order(id: :asc)
  end

  def show
    @artist = Artist.find(params[:id])
  end

end