class FileParser
  def parse(file_path)
    sections = get_sections(file_path)
    name = "Uploaded"
    result = []
    notes = []
    counter = 1
    sections.each do |line|
      if line.empty?
        result << [name, notes]
        note = []
        counter = 1
        next
      elsif counter == 1
        name = line if counter == 1
        counter += 1
      else
        notes << line.capitalize
      end
    end
    result
  end
  
  def get_sections(file_path)
    text = File.read(file_path)
    text.gsub("\r", "").gsub(/^(- )/, "").split("\n")
  end
end
