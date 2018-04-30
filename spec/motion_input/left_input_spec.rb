# 4 TESTS

require 'spec_helper'
require '././lib/motion_input/left_input'
require '././lib/motion_input/place_input'
require 'position'
require 'robot'
require 'style'
require 'table'

describe LeftCommand do

  describe '#execute' do

    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:left_command) { LeftCommand.new(robot) }

#TEST 1:
    it 'WEST ==> SOUTH' do
      position = Position.new(2, 1, 'WEST')
      PlaceCommand.new(robot, table, position).execute
      left_command.execute
      expect(robot.report).to eq('2,1,SOUTH')
    end
#TEST 2:
    it 'SOUTH ==> EAST' do
      position = Position.new(2, 1, 'SOUTH')
      PlaceCommand.new(robot, table, position).execute
      left_command.execute
      expect(robot.report).to eq('2,1,EAST')
    end
#TEST 3:
    it 'EAST ==> NORTH' do
      position = Position.new(2, 1, 'EAST')
      PlaceCommand.new(robot, table, position).execute
      left_command.execute
      expect(robot.report).to eq('2,1,NORTH')
    end
#TEST 4:
    it ' NORTH ==> WEST' do
      position = Position.new(2, 1, 'NORTH')
      PlaceCommand.new(robot, table, position).execute
      left_command.execute
      expect(robot.report).to eq('2,1,WEST')
    end
  end
end
