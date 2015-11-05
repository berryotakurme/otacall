class CallsController < ApplicationController

  def new
    @song = Song.find(params[:song_id])
    @call = Call.new
  end

  def create
    Call.create(create_params)
    redirect_to song_path(params[:song_id])
  end

  private
  def create_params
    params.require(:call).permit(:movie_url, :text).merge(song_id: params[:song_id], user_id: current_user.id)
  end

end