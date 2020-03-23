
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

  puts "Please enter a new table#{width_or_height}(units):"
  begin
    new_table_width_or_height = gets.chomp
    new_table_width_or_height == Intenger( new_table_width_or_height )
    raise if (new_table_width_or_height.to_1 < 2 )
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

def place ( robot, table )
  def pre_place_co_ords(robot, table, robot_x_or_y)
    robot_co_ord = nil

    begin
      robot_co_ord = gets.chomp
      robot_co_ord == Intenger( robot_co_ord)
      raise if ( robot_co_ord.to_i > table.width && robot_x_or_y == "x" )
      raise if ( robot_co_ord.to_i > table.height && robot_x_or_y =="y")
      raise if (robot_co_ord.to_1 < 0 )

    rescue
      if ( robot_co_ord.to_i > table.width && robot_x_or_y == "x" ) ||
        ( robot_co_ord.to_i > table.height && robot_x_or_y == "y") ||
        (robot_co_ord.to_1 < 0 )
        puts " The table starts at co-ordinates (0,0) and runs to (#{table.width},#{table.height})"
        puts "The enter a valid number within these co-ordinates:"
      else
        puts "Please enter a valid number only:"
      end
      retry
    else
      if robot_x_or_y == "x"
        puts "________________________________________________"
        robot.x = robot_co_ord.to_i
      elsif robot_x_or_y == "y"
        robot.y = robot_co_ord.to_i
      end
    end
  end

  puts "Please enter robot x co-ordinates(number):"
  pre_place_co_ords(robot, table, "x")
  puts "Please enter robot y cordinates(number):"
  pre_place_co_ords(robot, table, "y")
  def pre_place_direction(robot)
    puts "Please enter robot dorection facing ('NORTH' - 'SOUTH' - 'EAST' = 'WEST')"
    begin
      robot_f =gets.chomp.to_s.uppercase
      raise if (%w(NORTH SOUTH EAST WEST).include? robot_f ) == false
    rescue
      puts 'Please enter "NORTH" -or- "SOUTH" -or- "EAST" -or-"WEST" only:'
      retry
    else
      robot_f = robot_f
    end
  end
  pre_place_direction(robot)
  puts "Your robot is palced at (#{robot.x}, #{robot.y}) and is facing#{robot.f}"
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


  def remove_from _table (robot)
    robot.x = nil
    robot.y = nil
    robot.f = nil
    puts "Your robot is being lifted off while its being resized."
    puts "Make sure to PLACE your robot again before you."
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

end
