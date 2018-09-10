class NotesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :note_author, only: [:edit, :update, :destroy]

  def new
    @note = Note.new(flash[:note])
  end

  def create
    note = current_user.notes.build(note_params)
    if note.save
      flash[:notice] = "新規ノートを作成しました"
      redirect_to current_user
    else
      redirect_to new_note_path, flash: {
        note: note,
        error_messages: note.errors.full_messages
      }
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      flash[:notice] = "「#{@note.title}」のノートを更新しました"
      redirect_to @note
    else
      flash[:error_messages] = @note.errors.full_messages
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.delete
    flash[:notice] = "#{@note.title}が削除されました"
    redirect_to current_user
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end

  def note_author
    unless current_user == Note.find(params[:id]).user
      flash[:danger] = "許可されていないアクションです"
      redirect_to current_user
    end
  end
end
