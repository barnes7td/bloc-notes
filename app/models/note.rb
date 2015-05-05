class Note < ActiveRecord::Base
  
  def self.batch_import(file_path)
    notes = FileParser.new(file_path).parse
    
    notes.each do |note|
      note = new(
        name: note[0],
        place: note[1],
        text: note[2].join("\n")
      )
      note.save!
    end
  rescue => e
    puts e
    false
  end
  
end
