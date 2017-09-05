class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: { note_id: @note.id, status: 200 }
    else
      render json: { error: @note.errors.full_messages, status: 420 }
    end
  end

  def show
    @note = Note.find_by(id: params[:id])
    # If current note's user_id matches current session id, show note. If not, raise 404 error
  end

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    @note = Note.find_by(id: params[:id])
    if @note.update_attributes(note_params)
      render json: { note_id = @note.id, status: 200 }
    else
      render json: { error: @note.errors.full_messages, status: 420 }
    end
  end

  def destroy
    @note = Note.find_by(id: params[:id]).destroy
  end

  private

  def note_params
    params.require(:note).permit(:body, :user_id)
  end
end
