# 8 tests

require 'spec_helper'
require 'table'
require 'position'

describe Table do

  describe '#position_is_valid?' do

    let(:table) { Table.new(5, 5) }

			 # TEST : RETURN TRUE IF X  & Y ARE BOTHE VALID (1 TEST)
             #--------------------------------------------------------------
# TEST 1 : X AND Y ARE VALID
    it 'returns true when x and y are valid' do
      position = Position.new(2, 3, 'NORTH')
      expect(table.position_is_valid?(position)).to be true
    end
             # TEST : RETURN FALSE IF X OR Y OR BOTHE ARE NEGATIVE (3 test)
             #--------------------------------------------------------------
# TEST 2 : IF X < 0   
    it 'X is negative ==> false' do
      position = Position.new(-3, 2, 'NORTH')
      expect(table.position_is_valid?(position)).to be false
    end
# TEST 3 : IF Y < 0 
    it 'Y is negative ==> falsee' do
      position = Position.new(2, -2, 'NORTH')
      expect(table.position_is_valid?(position)).to be false
    end
# TEST 4 : IF Y < 0 AND X <0
    it ' X and Y are negative ==>false' do
      position = Position.new(-2, -1, 'NORTH')
      expect(table.position_is_valid?(position)).to be false
    end
             # TEST : RETURN FALSE IF X OR Y OR BOTHE ARE MORE THAN 5 (3 test)
             #--------------------------------------------------------------
# TEST 5 : IF X > 5  
    it 'X is more than 5 ==> false' do
      position = Position.new(6, 2, 'NORTH')
      expect(table.position_is_valid?(position)).to be false
    end
# TEST 6 : IF Y > 5 
    it 'Y is more than 5 ==> false' do
      position = Position.new(2, 6, 'NORTH')
      expect(table.position_is_valid?(position)).to be false
    end
# TEST 7 : IF X > 5    &    Y > 5
    it 'X and Y are more than 5 ==> false' do
      position = Position.new(6, 6, 'NORTH')
      expect(table.position_is_valid?(position)).to be false
    end
             # TEST : OTHER COMBINATION (1 test)
             #--------------------------------------------------------------
# TEST 8 : IF X < 0    &    Y > 5
    it 'X is negative Y are more than 5 ==> false' do
      position = Position.new(-2, 6, 'NORTH')
      expect(table.position_is_valid?(position)).to be false
    end

  end
end
