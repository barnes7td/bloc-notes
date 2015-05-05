require_relative "../../app/services/file_parser.rb"

RSpec.describe FileParser do
  before do
    file_path = File.expand_path('../../../spec/support/test_list.txt', __FILE__)
    @file_parser = FileParser.new(file_path)
  end
  
  describe "#parse" do
    it "turns it into an Array" do
    end
  end
end
