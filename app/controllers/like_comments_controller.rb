class LikeCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.find(params[:comment_id])
    unless @comment.like?(current_user)
      @comment.like(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @comment = LikeComment.find_by(comment_id: params[:comment_id]).comment
    if @comment.like?(current_user)
      @comment.unlike(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
