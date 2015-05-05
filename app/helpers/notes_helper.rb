module NotesHelper
  def format_notes(lines)
    html_list = lines.split("\n").map do |line|
      content_tag(:li, line)
    end
    
    content_tag(:ul) do
      html_list.join("\n").html_safe
    end
  end
end
