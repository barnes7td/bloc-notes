class FileParser
  attr_accessor :text, :sections
  
  def initialize(file_path)
    @text   = File.read(file_path)
    @result = []
    @sections = []
  end
  
  def parse
    remove_unwanted_characters
    split_and_capitalize
    separate_into_sections
    separate_names_from_sections
  end
  
  def remove_unwanted_characters
    @text = text.gsub("\r", "").gsub(/^(- )/, "")
  end
  
  def split_and_capitalize
    @sections = text.split("\n").map { |i| i.capitalize }
  end
  
  def separate_into_sections
    @sections = sections.chunk { |i| i == "" }
      .map   { |g| !g.first ? g.last : nil }.compact
  end
  
  def separate_names_from_sections
    sections.map do |section|
      [name(section), place(section), notes(section)]
    end
  end
  
  def name(section)
    section[0].titleize
  end
  
  def place(section)
    section[1].titleize
  end
  
  def notes(section)
    section[2..-1]
  end
end
