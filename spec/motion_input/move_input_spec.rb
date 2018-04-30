# 5 tests

require 'spec_helper'
require '././lib/motion_input/move_input'
require '././lib/motion_input/place_input'
require 'position'
require 'robot'
require 'table'

describe MoveCommand do

  describe '#execute' do

    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:move_command) { MoveCommand.new(robot, table) }

#TEST 1
    it ' if the robot facing is WEST: X= X-1' do
      position = Position.new(1, 1, 'WEST')
      PlaceCommand.new(robot, table, position).execute
      move_command.execute
      expect(robot.report).to eq('0,1,WEST')
    end

#TEST 2
    it 'if the robot facing is EAST: X= X+1' do
      position = Position.new(1, 1, 'EAST')
      PlaceCommand.new(robot, table, position).execute
      move_command.execute
      expect(robot.report).to eq('2,1,EAST')
    end

#TEST 3
    it 'if the robot facing is NORTH: Y= Y+1' do
      position = Position.new(1, 1, 'NORTH')
      PlaceCommand.new(robot, table, position).execute
      move_command.execute
      expect(robot.report).to eq('1,2,NORTH')
    end

#TEST 4
    it 'if the robot facing is SHOUTH: Y= Y-1' do
      position = Position.new(1, 1, 'SOUTH')
      PlaceCommand.new(robot, table, position).execute
      move_command.execute
      expect(robot.report).to eq('1,0,SOUTH')
    end

#TEST 5
    it 'If the position is invalid, don t do anything' do
      position = Position.new(4, 4, 'NORTH')
      PlaceCommand.new(robot, table, position).execute
      move_command.execute
      expect(robot.report).to eq('4,4,NORTH')
    end

  end
end
