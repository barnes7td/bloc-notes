class Note < ActiveRecord::Base
  def self.import(file)
    text = File.read(params[:file].path)
  end
end
