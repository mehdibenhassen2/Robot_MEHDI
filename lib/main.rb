
# Requisted files
require_relative 'table'
require_relative 'robot'
require_relative 'style'        # style of output
require_relative 'user'
require_relative 'position'
require_relative 'motion_input/move_input'   # move the rebot
require_relative 'motion_input/left_input'   # turn the rebot to rigth (east), 
require_relative 'motion_input/right_input'  # turn the rebot to rigth (east), 
require_relative 'motion_input/place_input'  #place your rebot
require_relative 'motion_input/report_input' # display the result
require_relative 'help'         #if you need help

# initializes a new table 5x5, a new robot, and a new command interpreter
table = Table.new(5, 5)
robot = Robot.new
user = User.new(robot, table)

puts ( 'Please enter your command:'.center(100).blue)
puts ('PLACE x, y, DIRECTION || LEFT || RIGHT || MOVE || REPORT'.center(100).blue)
puts ( 'Or tape "EXIT" to close this interface'.center(100).blue)
puts ( 'IF you need help tape "HELP"'.center(100).blue)
puts ( '-------------------------------------------------------'.center(100).blue)
# read commands until user enter 'EXIT'
loop do
  
  user_input = gets
 
  if user_input =~ /exit/i
    break 
end
  if user_input =~ /help/i   #ask for details and help
  instance=Help.new
  instance.help_input
  end
  command = user.parse(user_input)

  command.execute unless command.nil?


end
