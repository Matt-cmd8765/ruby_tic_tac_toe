# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
  subject(:newgame) { described_class.new }
  describe '#win / lose / tie' do
    context 'Correctly calls winner' do
      it 'Calls correct winner when top row is all X' do
        hash = { 1 => 'X', 2 => 'X', 3 => 'X', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }
        expect(newgame.winner?(hash)).to be true
      end
      it 'Correctly calls winner when bottom row is all O' do
        hash = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => 'O', 8 => 'O', 9 => 'O' }
        expect(newgame.winner?(hash)).to be true
      end
      it 'Correctly calls diagnol winner' do
        hash = { 1 => 'X', 2 => '2', 3 => '3', 4 => '4', 5 => 'X', 6 => '6', 7 => '7', 8 => '8', 9 => 'X' }
        expect(newgame.winner?(hash)).to be true
      end
    end
    context 'Does not call winner' do
      it 'Does not call winner when win condition not met' do
        hash = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => 'X', 6 => '6', 7 => '7', 8 => '8', 9 => 'X' }
        expect(newgame.winner?(hash)).to_not be true
      end
    end
    context 'Tie' do
      it 'Correctly calls tie' do
        counter = 9
        expect(newgame.tie?(counter)).to be true
      end
    end
  end
  describe '#Player info' do
    let(:player1) { double('player1', name: 'Matt') }
    let(:player2) { double('player2', name: 'Brad') }
    context 'Player names' do
      it 'Correctly takes the players name' do
        expect(player1.name).to eq('Matt')
        expect(player2.name).to eq('Brad')
      end
    end
  end
end

describe Player do
  subject(:player) { described_class.new('Matt') }
  describe '#X and O' do
    context 'Assign Symbols' do
      before do
        ass = 'O'
        allow(player).to receive(:gets).and_return(ass)
      end
      it 'Does not give error message with valid input' do
        error_message = 'Only Xs or Os!'
        expect(player).not_to receive(:puts).with(error_message)
        player.player_symbol
      end
      it 'Can assign correct symbol with valid input for player 2' do
        sym = 'X'
        expect(player.assign_player2_symbol(sym)).to eq('O')
      end
    end
    context 'Right error message' do
      before do
        boob = 's'
        valid = 'X'
        allow(player).to receive(:gets).and_return(boob, valid)
      end
      it 'returns error with invalid input' do
        error_message = "Only X's and O's!"
        expect(player).to receive(:puts).with(error_message).once
        player.player_symbol
      end
    end
  end
end