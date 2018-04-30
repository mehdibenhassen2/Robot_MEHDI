# 11 tests

require 'spec_helper'
require 'user'
require 'position'
require 'robot'
require 'table'
require 'motion_input/left_input'
require 'motion_input/move_input'
require 'motion_input/place_input'
require 'motion_input/right_input'
require 'motion_input/report_input'


describe User do

  let(:robot) { Robot.new }
  let(:table) { Table.new(5, 5) }
  let(:user) { User.new(robot, table) }

  describe '#parse' do

					  	#TEST OF PLACE INPUT (2tests)
					  	#------------------
    context 'PLACE input' do
      input = 'PLACE 1, 2, WEST'

      it 'creates command with valid input' do
        position = instance_double('Position', x: 1, y: 2, direction: 'WEST')

        expect(Position).to receive(:new).with(1, 2, 'WEST').and_return(position)

        expect(PlaceCommand).to receive(:new).with(robot, table, position)

        user.parse(input)
      end

      it 'returns input' do
        expect(user.parse(input)).to be_a PlaceCommand
      end
    end
                          #TEST OF REPORT INPUT (2tests)
  	                      #------------------
    context 'REPORT input' do
      input = 'REPORT'

      it 'creates command with the valid input' do
        expect(ReportCommand).to receive(:new).with(robot)

        user.parse(input)
      end

      it 'returns input' do
        expect(user.parse(input)).to be_a ReportCommand
      end
    end
						  	#TEST OF MOVE INPUT (2tests)
						  	#------------------
    context 'MOVE input' do
      input = 'MOVE'

      it 'creates command with valid input' do
        expect(MoveCommand).to receive(:new).with(robot, table)

        user.parse(input)
      end

      it 'returns input' do
        expect(user.parse(input)).to be_a MoveCommand
      end
    end
						  	#TEST OF LEFT INPUT (2tests)
						  	#------------------
    context 'LEFT input' do
      input = 'LEFT'

      it 'creates command with valid input' do
        expect(LeftCommand).to receive(:new).with(robot)

        user.parse(input)
      end

      it 'returns input' do
        expect(user.parse(input)).to be_a LeftCommand
      end
    end
						  	#TEST OF RIGHT INPUT (2tests)
						  	#------------------
    context 'RIGHT input' do
      input = 'RIGHT'

      it 'creates command with valid input' do
        expect(RightCommand).to receive(:new).with(robot)

        user.parse(input)
      end

      it 'returns input' do
        expect(user.parse(input)).to be_a RightCommand
      end
    end

						  	#TEST OF INVALID INPUT (1 test)
						  	#------------------
    context 'Invalid input' do
      it 'returns nil' do
        input = 'mehdi'

        expect(user.parse(input)).to be nil
      end
    end
  end
end