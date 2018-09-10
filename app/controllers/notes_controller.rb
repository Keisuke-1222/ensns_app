class NotesController < ApplicationController
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

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
