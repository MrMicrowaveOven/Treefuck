class Treehugger
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
            commands = commands.slice(end_of_brackets_index + 1, commands.length)
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
      # I'm not sure if an uninitialized parent should set
      # this node as left_child or right_child by default,
      # so I'll just raise an error for now.
      raise StandardError, "No parent initialized" unless @parent
      @parent ||= Treehugger.new
      @parent.run_commands(commands)
    end

    def left_child(commands)
      @left_child ||= Treehugger.new("", self)
      @left_child.run_commands(commands)
    end

    def right_child(commands)
      @right_child ||= Treehugger.new("", self)
      @right_child.run_commands(commands)
    end
end
