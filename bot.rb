
#Table class
class Table
    attr_accessor :initialize, :width, :height

    def initialize( width, height )
      @width = width
      @height = height
    end

#apply grid value
def apply_grid_value ( table, width_or_height, new_table_width_or_height )
    if width_or_height == 'width'
      table.width = new_table_width_or_height
    elsif width_or_height == 'height'
      table.height = new_table_width_or_height
    end
end

#Set grid value
def set_grid_value (table, width_or_height)
  if width_or_height == 'height'
    puts "-------------------------------------"
  end

  puts "Please enter a new table#{width_or_height}( units):"
  begin
    new_table_width_or_height = gets.chomp
    new_table_width_or_height == Intenger( new_table_width_or_height )
    raise if (new_table_width_or_height.to_i < 2 )
    rescue
    puts "Please enter a numeric value greater than 1:"
    retry
    else
    new_table_width_or_height = new_table_width_or_height.to_i
    apply_grid_value( table, width_or_height, (new_table_width_or_height - 1))
    end
  end
end



#Robot class
class Robot
  attr_accessor :initialize, :move, :place, :x, :y, :f
  def initialize
    @x = x
    @y = y
    @f = f
  end

  def place(robot, table)
      def pre_place_co_ords(robot, table, robot_x_or_y)

        robot_co_ord = nil
        begin
          robot_co_ord = gets.chomp
          robot_co_ord == Integer(robot_co_ord)
          raise if (robot_co_ord.to_i > table.width && robot_x_or_y == "x")
          raise if (robot_co_ord.to_i > table.height && robot_x_or_y == "y")
          raise if (robot_co_ord.to_i < 0)
        rescue
          if
            (robot_co_ord.to_i > table.width && robot_x_or_y == "x") ||
            (robot_co_ord.to_i > table.height && robot_x_or_y == "y") ||
            (robot_co_ord.to_i < 0)
            puts "The table starts at co-ordinates (0,0) and runs to (#{table.width},#{table.height})"
            puts "Please enter a valid number within these co-ordinates:"
          else # error No1
            puts "Please enter a valid number only:"
          end
          retry
        else
          if robot_x_or_y == "x"
            puts "----------------------------------------------------"
            robot.x = robot_co_ord.to_i
          elsif robot_x_or_y == "y"
            robot.y = robot_co_ord.to_i
          end
        end
      end
      puts "Please enter robot x co-ordinates (number):"
      pre_place_co_ords(robot, table, "x")
      puts "Please enter robot y co-ordinates (number):"
      pre_place_co_ords(robot, table, "y")
      def pre_place_direction(robot)
        puts "Please enter robot direction facing ('NORTH' - 'SOUTH' - 'EAST' - 'WEST')"
        begin
          robot_f = gets.chomp.to_s.upcase
          raise if (%w(NORTH SOUTH EAST WEST).include? robot_f) == false
        rescue
          puts 'Please enter "NORTH" -or- "SOUTH" -or- "EAST" -or- "WEST" only:'
          retry
        else
          robot.f = robot_f
        end
      end
      pre_place_direction(robot)
      puts "Your robot is placed at (#{robot.x}, #{robot.y}) and is facing #{robot.f}"
    end
# Picture for the grid table
def picture

  puts'                     - -                           '
  puts'                   |      |                        '
  puts'                  [| |  | |]                       '
  puts'                   |      |                        '
  puts'                   |  -   |                        '
  puts'                    ------                         '
  puts'                      | |                          '
  puts'                   --------                        '
  puts'                  /   ||    \                      '
  puts'                 /  |[   ]|  \                     '
  puts'                /   |     |   \                    '
  puts'                /|\ |_____|   /|\                  '
  puts'                    / / \ \                        '
  puts'                   / /   \ \                       '
  puts'                   /       \                       '
  puts'                  /         \                      '
  puts'                 ()         ()                     '
end

  def place3n(table)
    picture
    if table.width < 3 || table.height < 3
      puts "Oops, table is too small for command to work"
      puts "Try making the table at least 4*4 wide the run PPP again"
    else
      @y = 3
      @y = 3
      @f = "NORTH"
    end
  end


  def remove_from_table (robot)
    robot.x = nil
    robot.y = nil
    robot.f = nil
    puts "Your robot is being lifted off while its being resized."
    puts "Make sure to PLACE your robot again before you start playing."
  end

  @x_modifier = 0
  @y_modifier = 0

  def check_direction
    case
    when (@f == "NORTH")
    @x_modifier = 0
    @y_modifier = 1

  when (@f == "EAST")
    @x_modifier = 1
    @y_modiier = 0

  when (@f == "SOUTH")
    @x_modifier = 0
    @y_modiier = -1

  when (@f == "WEST")
    @x_modifier = -1
    @y_modiier = 0
  else
    exit
  end
end


def move (robot, table)
  check_direction
  if ( robot.x + @x_modifier <= table.width && robot.x + @x_modifier >= 0 && robot.y + @y_modiier <= table.height && robot.y + @y_modiier >= 0)
    robot.x = robot.x + @x_modifier
    robot.y = robot.y + @y_modiier
    puts "Your robot has moved #{robot.f} by 1 place."
    puts "Your robot is now at co-ordinates (#{robot.x}, #{robot.y})."
  else
    puts "STOP! Your robot is at the edge of the table! Turn your robot LEFT or RIGHT to continue playing."
    puts "Your robot is at the edge of the table! Turn your robot LEFT or RIGHT to continue playing."
    puts "Run the TABLE command for more information about your table."
  end
end

  def turn_error_messages(robot)
    puts "Error, your Robot is direction value is '#{robot.f}', not NORTH -or- SOUTH -or EAST -or- WEST"
    puts "Please try again - run the PLACE command to enter a correct direction."
  end

#
def turn_left (robot)
  case
  when (robot.f == "NORTH")
    robot.f = "WEST"
  when (robot.f == "EAST")
    robot.f = "NORTH"
  when (robot.f == "SOUTH")
    robot.f = "EAST"
  when ( robot.f == "WEST")
    robot.f = "SOUTH"
  else
    turn_error_messages(robot)
  end
end

#
  def turn_right (robot)
    case
    when (robot.f =="NORTH")
      robot.f ="EAST"
    when (robot.f == "EAST")
      robot.f = "SOUTH"
    when (robot.f == "SOUTH")
      robot.f "WEST"
    when (robot.f == "WEST")
      robot.f ="NORTH"
    else
      turn_error_messages(robot)
    end
  end
end

class Play
  def initialize
  end

  def divider_yellow
    puts "--------------------------------------"
  end


def print_menu
  puts"________________________________________"
  puts "TOY ROBOT"
  divider_yellow
  puts"Choose an option: (case insensitive)"
  puts"MAKE"
  puts"PLACE"
  puts"MOVE"
  puts"LEFT"
  puts"RIGHT"
  puts"REPORT"

  divider_yellow

  puts"Bonus options:"
  puts"DESTROY - destroy the robot"
  puts"TABLE"
  puts"GRID - update the Table to a grid size of your choice"
  puts"EXIT - close the program"

  divider_yellow

  print "Your selection"
  puts
  gets.chomp.to_s.upcase
  end
end

@robot = nil
play = Play.new
table = nil


while true
  begin
    unless @table
      @table = Table.new(4, 4)
      table = @table
    end
    selection = play.print_menu
    case selection
    when "MAKE"
        unless @robot
          @robot = Robot.new
          puts "Robot has been built for you!"
           puts "Unique ID No. = #{@robot.__id__}"
        else
          play.divider_yellow
          puts "You already have a robot!"
           puts "Unique ID No. = #{@robot.__id__}"
        end

    when "DESTROY"
      if @robot
        @robot = nil
        play.divider_yellow
        puts "Your robot has been destroyed...aww..."
      else
        play.divider_yellow
        puts "You dont have a robot to destroy!"
      end
  when "PLACE"
    if @robot
      play.divider_yellow
      robot = @robot
      table = @table
      @robot.place(robot, table)
      else
        play.divider_yellow
        puts "Your robot doesn't exist yet. Please run MAKE first"
      end

    when "PPP"
      if @robot = Robot.new
      end

      table = @table
      @robot.place3n(table)
      puts "Your Robot details are as follos:"
      puts "Unique ID No. = #{@robot._id_}"
      if (@robot.x || @robot.y || @robot.f) !=
        nil
        puts " Your robot is placed at (#{robot.x}, #{@robot.y}) and is facing#{robot.f}"
      end
when "MOVE"
  if @robot && ((@robot.x || @robot.y || @robot.f ) != nil )
    robot = @robot
    @robot.move(robot, @table )
  elsif @robot && (@robot.x == nil)
    play.divider_yellow
    puts" Your robot isnt on the table yet, please PLACE your Robot on the table first!"
  else
    play.divider_yellow
    puts"Your robot doesn't exist yet. Please run MAKE first"
  end

when "LEFT"
  if @robot && ((@robot.x || @robot.y || @robot.f ) != nil )
    old_direction = @robot.f
    robot = @robot
    @robot.turn_left(robot)
    puts"Your robot was facing#{old_direction}, but is now facing #{@robot.f}."
  elsif @robot && (@robot.x == nil)
    play.divider_yellow
    puts "Your robot isn't on the table yet, please PLACE your Robot on the table first!"
  else
    puts "Your robot doesn't exist yet. Please run MAKE first"
  end


when "RIGHT"
  if @robot && ((@robot.x || @robot.y || @robot.f ) != nil)
    old_direction = @robot.f
    robot = @robot
    @robot.turn_right(robot)
    puts "Your robot isn't on the table yet, please PLACE your robot on the table first"
  else
    puts "Your robot doesn't exist yet. Please run MAKE first!"
  end
when "REPORT"
  if @robot
    play.divider_yellow
    puts "Your Robot details are as follows:"
    puts "Unique ID No. = #{@robot.__id__}"
    if ((@robot.x || @robot.y || @robot.f ) == nil)
    puts "Your robot isn't on the table yet, please PLACE your Robot on the table first!"
  else
    puts "Your robot is placed at (#{@robot.x }, #{@robot.y }) and id facing #{@robot.f}"
  end

else
  play.divider_yellow
  puts "Your robot doesn't exist yet. Please run MAKE first!"
end

when "TABLE"
  if @table
    play.divider_yellow
    puts "The table is a #{@table.width + 1 } x #{@table.height + 1 } grid."
    puts " It starts at co-ordinates (0,0) [SOUTH-WEST corner] and runs to co-ordinates (#{@table.width}, #{@table.height})[NORTH-EAST corner]"
  else
    play.divider_yellow
    puts "There is no Table yet!"
  end

when "GRID"
  if @table
    play.divider_yellow
    puts "The table is currently a #{@table.width + 1 } x #{@table.height + 1 } grid"
    puts "It starts at co-ordinates (0,0)
  [SOUTH_WEST corner ] and runs to co-ordinates(#{@table.width}, #{@table.height})[NORTH-EAST corner]"
  if @robot
    robot = @robot
    @robot.remove_from_table(robot)
  end

  table.set_grid_value(@table, 'width')
  table.set_grid_value(@table, 'height')
  play.divider_yellow
  puts "Your table now looks like this:"
  puts "#{@table.width + 1 } x #{@table.height + 1 } grid."
  puts "Your table now looks like this:"
  puts "It starts at co-ordinates (0,0) [OSUTH-WEST corner ] and runs to co-ordinates(#{@table.width}, #{@table.height}) [NORTH-EAST corner]"
else
  play.divider_yellow
  puts "There is no Table, you need to make one"
end

when "EXIT"
  play.divider_yellow
  puts "                "
  puts " BEEFY TOY ROBOT "
  puts "                "
  play.divider_yellow
  exit
else
  puts "Sorry, that command is not recognised. Please try again."
end
rescue SignalException => e
  puts e
  puts "________________________________________________"
  puts "   ERROR: please type to quit the game."
  puts "________________________________________________"
  retry
end
end
