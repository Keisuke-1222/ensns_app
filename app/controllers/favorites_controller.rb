class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    board = Board.find(params[:board_id])
    current_user.add_to_favorites(board)
    redirect_to board
  end

  def destroy
    board = Board.find(params[:id])
    current_user.remove_from_favorites(board)
    redirect_to board
  end
end
