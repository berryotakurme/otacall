class CommentsController < ApplicationController
  before_action :set_song_call, only: [:new, :create, :edit, :update]
  before_action :authenticate_user!, :only => [:new, :edit]
  def new
    @comment = Comment.new
  end

  def create
    Comment.create(create_params)
    redirect_to song_call_path(@song, @call), :flash => {:notice => "コメントを投稿しました！！"}
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.update(create_params)
      redirect_to song_call_path(@song, @call), :flash => {:notice => "コメントを編集しました！！"}
    else
      redirect_to song_call_path(@song, @call)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end


  private
  def create_params
    params.require(:comment).permit(:text).merge(call_id: params[:call_id], user_id: current_user.id)
  end

  def set_song_call
    @song = Song.find(params[:song_id])
    @call = Call.find(params[:call_id])
  end

end