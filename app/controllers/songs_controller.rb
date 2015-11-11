class SongsController < ApplicationController

  def show
    @song = Song.find(params[:id])
    @calls = @song.calls.page(params[:page]).per(5)
    page_index = params[:page] ? (params[:page].to_i-1) * 5 + 1 : 1
    @call_number = @calls.each.with_index(page_index) do |call, i|
      call.call_index = i
    end
    render :layout => 'song_show'
  end

  def search
    @songs = Song.where('name LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(20)
  end

end
