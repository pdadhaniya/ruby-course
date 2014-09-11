require_relative '../spec_helper.rb'

describe Songify::Genre do

  describe "#initialize" do
    it "should make a new genre" do
      result = Songify::Genre.new("Rap")
      expect(result.type).to eq("Rap")
    end
  end



end