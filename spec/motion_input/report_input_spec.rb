# 2 tests

require 'spec_helper'
require '././lib/motion_input/place_input'
require '././lib/motion_input/report_input'
require 'position'
require 'robot'
require 'style'
require 'table'

describe ReportCommand do

  describe '#execute' do

    let(:robot) { Robot.new }
    let(:table) { Table.new(5, 5) }

    context 'input valid position' do
      let!(:position) { Position.new(2, 2, 'NORTH') }

      it 'prints report to stdout' do
        report_command = ReportCommand.new(robot)

        PlaceCommand.new(robot, table, position).execute

        expected_report = "2,2,NORTH\n"

        expect { ReportCommand.new(robot).execute }.to output(expected_report).to_stdout
      end
    end

    context 'input invalid position' do
      let!(:position) { Position.new(-2, 2, 'NORTH') }

      it 'prints report to stdout' do
        report_command = ReportCommand.new(robot)

        PlaceCommand.new(robot, table, position).execute

        expected_report = "    ---------------------------------------------------------------------
    ERROR: your input is invalid, please check your input and the syntax
    ---------------------------------------------------------------------\n"

        expect { ReportCommand.new(robot).execute }.to output(expected_report).to_stdout
      end
    end
  end
end
