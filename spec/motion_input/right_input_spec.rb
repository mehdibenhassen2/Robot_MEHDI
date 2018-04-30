# 4 TESTS

require 'spec_helper'
require '././lib/motion_input/right_input'
require '././lib/motion_input/place_input'
require 'position'
require 'robot'
require 'style'
require 'table'

describe RightCommand do

  describe '#execute' do

    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:right_command) { RightCommand.new(robot) }

#TEST 1:
    it 'WEST ==> NORTH' do
      position = Position.new(2, 1, 'WEST')
      PlaceCommand.new(robot, table, position).execute
      right_command.execute
      expect(robot.report).to eq('2,1,NORTH')
    end
#TEST 2:
    it 'NORTH ==> EAST' do
      position = Position.new(2, 1, 'NORTH')
      PlaceCommand.new(robot, table, position).execute
      right_command.execute
      expect(robot.report).to eq('2,1,EAST')
    end
#TEST 3:
    it 'EAST ==> SOUTH' do
      position = Position.new(2, 1, 'EAST')
      PlaceCommand.new(robot, table, position).execute
      right_command.execute
      expect(robot.report).to eq('2,1,SOUTH')
    end
#TEST 4:
    it ' SOUTH ==> WEST' do
      position = Position.new(2, 1, 'SOUTH')
      PlaceCommand.new(robot, table, position).execute
      right_command.execute
      expect(robot.report).to eq('2,1,WEST')
    end
  end
end
