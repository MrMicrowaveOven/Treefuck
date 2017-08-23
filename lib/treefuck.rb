class Treefuck
    def initialize(command_string)
      @val = 0
      keep_going = true
      commands = command_string.chars
      until commands.empty?
        current_command = commands.shift
        case current_command
          when "."
            print @val
          when ","
            @val = gets.chomp
          when "+"
            @val += 1
          when "-"
            @val -= 1
        end
      end
    end

    def run(command_string)
    end

    def left_child(command_string)
        @left_child ||= Treefuck.new(command_string)
    end
end
