# 3 tests

require 'spec_helper'
require '././lib/motion_input/place_input'
require 'robot'
require 'table'
require 'position'

describe PlaceCommand do

  describe '#execute' do
    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }
    let(:place_command) { PlaceCommand.new(robot, table, position) }
#test 1
    context 'with valid position' do
      let(:position) { Position.new(2, 2, 'NORTH') }

      it 'places robot ' do
        place_command.execute

        expect(robot.report).to eq('2,2,NORTH')
      end
    end
#test 2
    context 'with invalid position' do
      let(:position) { Position.new(1, -1, 'NORTH') }

      it 'places robot ' do
        place_command.execute

        expect(robot.report).to eq("    ---------------------------------------------------------------------
    ERROR: your input is invalid, please check your input and the syntax
    ---------------------------------------------------------------------\n")
      end
    end
#test 3
    context 'with invalid position' do
      let(:position) { Position.new(1, -1, 'north') }

      it 'places robot ' do
        place_command.execute

        expect(robot.report).to eq("    ---------------------------------------------------------------------
    ERROR: your input is invalid, please check your input and the syntax
    ---------------------------------------------------------------------\n")
      end
    end
  end
end
