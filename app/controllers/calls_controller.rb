class CallsController < ApplicationController
before_action :authenticate_user!, :only => [:new, :edit]


  def new
    @song = Song.find(params[:song_id])
    @call = Call.new
  end

  def create
    Call.create(create_params)
    redirect_to song_path(params[:song_id])
  end

  def show
    @call = Call.find(params[:id])
  end

  def edit
    @song = Song.find(params[:song_id])
    @call = Call.find(params[:id])

  end

  def update
    @song = Song.find(params[:song_id])
    @call = Call.find(params[:id])
    if current_user.id == @call.user_id
      @call.update(create_params)
      redirect_to song_path(@song)
    else
      redirect_to song_path(@song)
    end
  end

  def destroy
    @call = Call.find(params[:id])
    @call.destroy
    redirect_to :back
  end

  private
  def create_params
    params.require(:call).permit(:movie_url, :text).merge(song_id: params[:song_id], user_id: current_user.id)
  end

end