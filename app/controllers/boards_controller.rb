class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @like = Like.where(user_id: current_user.id, board: @board.id)
  end

  def new
  end

  def create
    board = Board.create(
      title: params[:title],
      contents: params[:contents],
      #이 글을 작성한 사람이 현재 로그인한 사람이다.
      user_id: current_user.id
    )
    redirect_to "/boards/#{board.id}"
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update(
      title: params[:title],
      contents: params[:contents]
    )
    redirect_to "/boards/#{@board.id}"
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to "/"
  end

  def like_boards
    user_like = Like.where(user_id: current_user.id, board_id: params[:id])
    if user_like.count > 0
      user_like.first.destroy
    else
      Like.create(
        user_id: current_user.id,
        board_id: params[:id]
    )
    end
    @like = Board.find(params[:id]).likes.count
  end
end
