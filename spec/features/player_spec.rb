require 'player'

describe Player do

  subject(:player){described_class.new("Ross")}
  describe "#name" do
    it "returns the name" do
      expect(player.name).to eq "Ross"
    end
  end
end
