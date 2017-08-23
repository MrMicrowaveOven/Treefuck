class Treefuck
    def initialize(command_string)
      @val = 0
      keep_going = true
      commands = command_string.chars
      until commands.empty?
        current_command = commands.shift
        if current_command == "."
          print @val
        elsif current_command == ","
          @val = gets.chomp
        end
      end
    end

    def run(command_string)
    end

    def left_child(command_string)
        @left_child ||= Treefuck.new(command_string)
    end
end
