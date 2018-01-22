require_relative './command'

module TuringMachine
  class State
    class NotFound < StandardError; end

    FINAL_ID = 0

    attr_reader :id

    def self.build(id, commands_scheme)
      commands = commands_scheme.map do |(pattern, *steps, next_state_id)|
        Command.new(
          steps: steps,
          pattern: pattern,
          next_state_id: next_state_id
        )
      end

      new(id: id, commands: commands)
    end

    def initialize(id:, commands:)
      @id = id
      @commands = commands
    end

    def match(square)
      commands.find { |command| command.match?(square) }
    end

    def match!(square)
      command = match(square)
      raise NotFound,
            "Command not found for square #{square.inspect}" unless command
      command
    end

    private

    attr_reader :commands
  end
end
