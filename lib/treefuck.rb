class Treefuck
    def initialize(command_string)
      @val = 0
      keep_going = true
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
        end
      end
    end

    def left_child(command_string)
        @left_child ||= Treefuck.new(command_string)
    end
end
