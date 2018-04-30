# 15 tests

require 'spec_helper'
require 'style'
require 'help'
require 'robot'
require 'position'
require 'table'
require 'motion_input/left_input'
require 'motion_input/place_input'
require 'motion_input/right_input'
require 'motion_input/move_input'

describe Robot do

  let(:robot) { Robot.new }
  let(:table) { Table.new(5, 5) }

  describe '#place' do
    before do
      PlaceCommand.new(robot, table, position).execute
    end
#TEST OF PLACE COMMAND
#TEST1 : THE USER ENTER VALID POSITION OF REPBOT
    context 'with valid position' do
      let(:position) { Position.new(2, 3, 'NORTH') }

      it 'places robot in the correct position' do
        expect(robot.current_position).to eq(position)
      end
    end
#TEST2 : THE USER ENTER INVALID POSITION
    context 'with invalid position1' do
      let(:position) { Position.new(6, 7, 'NORTH') }

      it 'will not place robot' do
        expect(robot.current_position).to be nil   #NO CHANGE IN THE POSITION OF REBOT
      end
    end

#TEST3 : THE USER MAKE MISTAKE IN THE SYMTAX OF THE POSITION
    context 'with invalid SYNTAXE position2' do
      let(:position) { Position.new(6,7, 'NORTH') }

      it 'will not place robot' do
        expect(robot.current_position).to be nil   #NO CHANGE IN THE POSITION OF REBOT
      end
    end

  end
#TEST FOR REPORT

  describe '#report' do
    let(:position) { Position.new(1, 3, 'NORTH') }
#test 4: TEST IF THE USER THE PLACE'
    context 'after enter the place of the robot' do
      it 'reports current position correctly' do
        PlaceCommand.new(robot, table, position).execute

        expect(robot.report).to eq('1,3,NORTH')
      end
    end
#TEST 5: TEST IF THE USER ENTER OTHER COMMANDE BEFORE 'PLACE'
    context 'before enter the place of the robot' do
      it 'reports error message' do
        expect(robot.report).to eq("    ---------------------------------------------------------------------
    ERROR: your input is invalid, please check your input and the syntax
    ---------------------------------------------------------------------\n")
      end
    end
  end
                         #TEST FOR REPORT
                         #---------------
  describe '#report' do
#TEST 6
    it 'returns a short report' do
      position = Position.new(1, 1, 'NORTH')

      PlaceCommand.new(robot, table, position).execute

      expect(robot.report).to eq('1,1,NORTH')
    end
  end

  describe '#execute_command' do
    context 'when placed correctly' do

                          #TEST ROTATION (2 TEST)
                          #----------------------
#TEST 7: ROTATE TO LEFT   	
      it 'CORRECT ROTATION TO THE LEFT' do
        position = Position.new(4, 1, 'NORTH')

        PlaceCommand.new(robot, table, position).execute

        LeftCommand.new(robot).execute

        expect(robot.report).to eq('4,1,WEST')
      end

#TEST 8: ROTATE TO RIGHT
      it 'CORRECT ROTATION TO THE RIGHT' do
        position = Position.new(1, 4, 'NORTH')

        PlaceCommand.new(robot, table, position).execute

        RightCommand.new(robot).execute

        expect(robot.report).to eq('1,4,EAST')
      end

                          #TEST MOVE COMMANDE  (4 TEST)  
                          #----------------------------

#TEST 9: TEST OF SOUTH MOTION
      it 'correctly moves NORTH' do
        position = Position.new(3, 3, 'NORTH')

        PlaceCommand.new(robot, table, position).execute

        MoveCommand.new(robot, table).execute

        expect(robot.report).to eq('3,4,NORTH')
      end
#TEST 10: TEST OF SOUTH MOTION
      it 'CORRECT MOTION TO SOUTH' do
        position = Position.new(2, 1, 'SOUTH')

        PlaceCommand.new(robot, table, position).execute

        MoveCommand.new(robot, table).execute

        expect(robot.report).to eq('2,0,SOUTH')
      end
#TEST 11: TEST OF EAST MOTION
      it 'CORRECT MOTION TO EAST' do
        position = Position.new(2, 2, 'EAST')

        PlaceCommand.new(robot, table, position).execute

        MoveCommand.new(robot, table).execute

        expect(robot.report).to eq('3,2,EAST')   # RESULT: THE X=X+1; Y=Y, ORIIENTATION=ORIENTATION
      end
#TEST 12: TEST OF WEST MOTION
      it 'CORRECT MOTION TO WEST' do
        position = Position.new(1, 1, 'WEST')

        PlaceCommand.new(robot, table, position).execute

        MoveCommand.new(robot, table).execute

        expect(robot.report).to eq('0,1,WEST')
      end

    end
#TEST 13: TEST OF COMMANDS BEFORE THE PLACE THE ROBOT
    context 'before being placed in a table' do
      it 'ignores other commands' do
        MoveCommand.new(robot, table).execute
        LeftCommand.new(robot).execute
        RightCommand.new(robot).execute

        expect(robot.report).to eq("    ---------------------------------------------------------------------
    ERROR: your input is invalid, please check your input and the syntax
    ---------------------------------------------------------------------\n") #ERROR MESSAGE
      end
    end
  end

  describe '#placed?' do
#TEST 14
    context 'before robot is placed' do
      it 'returns false' do
        expect(robot.placed?).to be false
      end
    end
#TEST 15
    context 'after robot is placed' do
      it 'returns true' do
        PlaceCommand.new(robot, table, Position.new(1, 2, 'EAST')).execute

        expect(robot.placed?).to be true
      end
    end
  end
end
