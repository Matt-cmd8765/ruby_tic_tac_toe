# frozen_string_literal: true

require_relative '../lib/game'

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
end