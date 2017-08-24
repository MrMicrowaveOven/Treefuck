class Treefuck
    def initialize(command_string = "", parent = nil)
      @val = 0
      @parent = parent
      commands = command_string.chars
      run_commands(commands)
    end

    def run_commands(commands)
      until commands.empty?
        current_command = commands.shift
        case current_command
          when "."
            print @val
          when ","
            @val = gets.chomp.to_i
          when "+"
            @val += 1
          when "-"
            @val -= 1
          when "["
            until @val == 0
              run_commands(commands.join.match(/[^\]\[]*\]/).to_a.first.chars)
            end
            end_of_brackets_index = commands.index("]")
            commands = commands.slice(end_of_brackets_index, commands.length)
          when "]"
            return
          when "<"
            left_child(commands)
            return
          when ">"
            right_child(commands)
            return
          when "|"
            parent(commands)
            return
        end
      end
    end

    def parent(commands)
      if @parent
        @parent.run_commands(commands)
      else
        @parent = Treefuck.new(commands.join)
      end
    end

    def left_child(commands)
      if @left_child
        @left_child.run_commands(commands)
      else
        @left_child = Treefuck.new(commands.join, self)
      end
    end

    def right_child(commands)
      if @right_child
        @right_child.run_commands(commands)
      else
        @right_child = Treefuck.new(commands.join, self)
      end
    end
end
