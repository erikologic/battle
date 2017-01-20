require 'game'

describe Game do
  subject(:game){described_class.new}
  let(:player_london){double(:player)}
  let(:player_chicago){Player.new("Rob")}

  describe '#attack' do
    it 'can deduct hp from player' do
      allow(player_london).to receive(:points) { 100 }
      expect(player_london).to receive(:points=).with(90)
      game.attack(player_london)

      expect{game.attack(player_chicago)}.to change{player_chicago.points}.by(-10)
    end
  end
end
