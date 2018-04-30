#13 tests
#actuel facing==> returned facing

require 'spec_helper'
require 'position'

describe Position do

  describe '#go_to' do
#TEST 1    
    it '==> WEST' do
      position = Position.new(2, 1, 'WEST')
      expect(position.go_to('WEST')).to eq(Position.new(1, 1, 'WEST'))
    end
#TEST 2 
    it '==> NORTH' do
      position = Position.new(2, 1, 'NORTH')
      expect(position.go_to('NORTH')).to eq(Position.new(2, 2, 'NORTH'))
    end
#TEST 3 
    it '==> SOUTH' do
      position = Position.new(2, 1, 'SOUTH')
      expect(position.go_to('SOUTH')).to eq(Position.new(2, 0, 'SOUTH'))
    end
#TEST 4 
    it '==> EAST' do
      position = Position.new(2, 1, 'EAST')
      expect(position.go_to('EAST')).to eq(Position.new(3, 1, 'EAST'))
    end

  end

  describe '#==' do
#TEST 5     
    it 'returns true when x and y are the same in both positions' do
      position_one = Position.new(2, 2, 'NORTH')
      position_two = Position.new(2, 2, 'NORTH')
      expect(position_one).to eq(position_two)
    end
  end
#TEST 6 
  describe '#direction_left' do
    it 'NORTH ==> WEST' do
      position = Position.new(3, 2, 'NORTH')
      expect(position.direction_left).to eq('WEST')
    end
#TEST 7 
    it 'WEST ==> SOUTH' do
      position = Position.new(3, 2, 'WEST')
      expect(position.direction_left).to eq('SOUTH')
    end
#TEST 1 
    it 'SOUTH ==> EAST' do
      position = Position.new(3, 2, 'SOUTH')
      expect(position.direction_left).to eq('EAST')
    end
#TEST 8 
    it 'EAST ==> NORTH' do
      position = Position.new(3, 2, 'EAST')
      expect(position.direction_left).to eq('NORTH')
    end
  end

  describe '#direction_right' do
#TEST 9     
    it 'NORTH ==> EAST' do
      position = Position.new(3, 2, 'NORTH')
      expect(position.direction_right).to eq('EAST')
    end
#TEST 10 
    it 'EAST ==> SOUTH' do
      position = Position.new(3, 2, 'EAST')
      expect(position.direction_right).to eq('SOUTH')
    end
#TEST 11 
    it 'SOUTH ==> WEST' do
      position = Position.new(3, 2, 'SOUTH')
      expect(position.direction_right).to eq('WEST')
    end
#TEST 12 
    it 'WEST ==> NORTH' do
      position = Position.new(3, 2, 'SOUTH')
      expect(position.direction_right).to eq('WEST')
    end
  end
end
