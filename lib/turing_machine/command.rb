require_relative './command_runners/move'
require_relative './command_runners/write'

module TuringMachine
  class Command
    class NotFound < StandardError; end

    RUNNERS_MAP = {
      move: CommandRunners::Move.new,
      write: CommandRunners::Write.new
    }

    attr_reader :next_state_id

    def initialize(steps:, pattern:, next_state_id:)
      @steps = steps
      @pattern = pattern
      @next_state_id = next_state_id
    end

    def match?(square)
      case pattern
      when '_'
        square.empty?
      when '*'
        square.filled?
      else
        square == Square.new(pattern)
      end
    end

    def run!(tape:, head:)
      steps.each do |(action, value)|
        runner = RUNNERS_MAP[action]
        raise NotFound,
              "Runner not found for action #{action}" unless runner

        runner.call!(tape: tape, head: head, value: value)
      end
    end

    def final?
      State::FINAL_ID == next_state_id
    end

    private

    attr_reader :steps, :pattern
  end
end
