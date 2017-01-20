require 'game'

describe Game do
  subject(:game){described_class.new}
  let(:player_london){double(:player)}
  let(:player_chicago){Player.new("Rob")}
  let(:player_1){Player.new("Jack")}
  let(:player_2){Player.new("Enrico")}

  describe '#player_1' do
    it "stores an instance of player as player_1" do
      game.player_1 = player_1
      expect(game.player_1.name).to eq "Jack"
    end
  end

  describe '#player_2' do
    it "stores an instance of player as player_2" do
      game.player_2 = player_2
      expect(game.player_2.name).to eq "Enrico"
    end
  end

  describe '#attack' do
    it 'can deduct hp from player' do
      allow(player_london).to receive(:points) { 100 }
      expect(player_london).to receive(:points=).with(90)
      game.attack(player_london)

      expect{game.attack(player_chicago)}.to change{player_chicago.points}.by(-10)
    end
  end
end
