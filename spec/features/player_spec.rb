require 'player'

describe Player do
  subject(:player) { described_class.new("Robalicious") }
  describe "#name" do

    it "Returns player name" do
      expect(player.name).to eq "Robalicious"
    end
  end

  describe '#points' do
    it 'display points' do
      expect(player.points).to eq 100
    end
    it 'are deductable' do
      expect{player.points -= 10}.to change{player.points}.to(90)
    end

    it 'raises an error whenever points will be 0 or less' do
      expect{player.points = 0}.to raise_error("Game Over!")
    end
  end

end
