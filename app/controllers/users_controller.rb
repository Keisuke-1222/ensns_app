class UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      @notes = @user.feed.page(params[:page])
    else
      @notes = @user.notes.page(params[:page])
    end
  end
end
