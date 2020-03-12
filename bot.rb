class Table
    attr_accessor :initialize, :width, :height

    def initialize( width, height )
      @width = width
      @height = height
    end

def apply_grid_value ( table, width_or_height, new_table_width_or_height )
    if width_or_height == 'width'
      table.width = new_table_width_or_height
    elsif width_or_height == 'height'
      table.height = new_table_width_or_height
    end
end

def set_grid_value (table, width_or_height)
  if width_or_height == 'height'
    puts "-------------------------------------"
  end

  puts "Please enter a new table#{width_or_height}(units):"
  begin
    new_table_width_or_height = gets.chomp
    new_table_width_or_height == ( new_table_width_or_height )
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
