class NotesController < ApplicationController
  def index
    @notes = Note.all
  end
  
  def new
    @new_note = Note.new
  end
  
  def create
    @note = Note.new(note_params)
    @note.save
    redirect_to :root
  end
  
  def new_upload
  end
  
  def upload
    Note.batch_import(params[:file].path)
    flash[:success] = "File successfully imported!"
    
    redirect_to :root
  end
  
  def search
    @search = params[:search]
    @notes = Note.where("name LIKE ? OR place LIKE ?", "%#{@search}%", "%#{@search}%")
    render :index
  end
  
  private
  
  def note_params
    params.require(:note).permit(:name, :person, :text)
  end
end
