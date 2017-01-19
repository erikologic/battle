require 'player'

describe Player do
  subject(:player) { described_class.new("Robalicious") }
  describe "#name" do

    it "Returns player name" do
      expect(player.name).to eq "Robalicious"
    end
  end

end
