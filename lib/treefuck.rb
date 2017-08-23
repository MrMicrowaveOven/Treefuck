class Treefuck
    def initialize(command_string)
        @val = 0
        if command_string.chars.first == "."
          print @val
        end
        # command_string.chars.first
    end

    def left_child(command_string)
        @left_child ||= Treefuck.new(command_string)
    end
end
