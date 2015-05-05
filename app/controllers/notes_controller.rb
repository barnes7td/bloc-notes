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
    notes = FileParser.parse(params[:file].path)
    
    notes.each do |note|
      note = Note.new(
        name: params[:name],
        person: note[0],
        text: note[1].join("\n")
      )
      note.save
    end
    
    redirect_to :root
  end
  
  private
  
  def note_params
    params.require(:note).permit(:name, :person, :text)
  end
end
