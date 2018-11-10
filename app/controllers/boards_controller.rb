class BoardsController < ApplicationController
  before_action :set_target_board, only: [:show, :edit, :update, :destroy]
  before_action :board_owner, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # タグで絞り込み
    @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all

    # お気に入りのみ表示
    if params[:favorite] == "1"
      @boards = current_user.like_boards
    end

    @boards = @boards.includes(:tags, :user).sorting_by(params[:sort]).page(params[:page])
  end

  def new
    @board = Board.new(flash[:board])
  end

  def create
    board = Board.new(board_params)
    if board.save
      flash[:notice] = "「#{board.title}」のトピックを作成しました"
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    @comment = Comment.new(board_id: @board.id)
    @comments = @board.comments.includes(:user, :like_users).page(params[:page])
  end

  def edit
  end

  def update
    if @board.update(board_params)
      flash[:notice] = "「#{@board.title}」のトピックを更新しました"
      redirect_to @board
    else
      flash[:error_messages] = @board.errors.full_messages
      render :edit
    end
  end

  def destroy
    @board.destroy

    redirect_to boards_path, flash: { notice: "「#{@board.title}」のトピックが削除されました" }
  end

  private

  def board_params
    params.require(:board).permit(:user_id, :title, :body, tag_ids: [])
  end

  def set_target_board
    @board = Board.find(params[:id])
  end

  def board_owner
    unless current_user == @board.user
      flash[:danger] = "許可されていないユーザーです"
      redirect_to @board
    end
  end
end
