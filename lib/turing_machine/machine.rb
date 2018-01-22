require_relative './head'
require_relative './tape'
require_relative './register'

require_relative './state'
require_relative './square'

module TuringMachine
  class Machine
    def self.build
      new(
        head: Head.new,
        tape: Tape.new,
        states_register: Register.new
      )
    end

    def initialize(head:, tape:, states_register:)
      @head = head
      @tape = tape
      @states_register = states_register
    end

    def write(input)
      input.split('').each { |bit| tape << Square.new(bit) }
      tape << Square.new
    end

    def register(id, commands_scheme)
      states_register << State.build(id, commands_scheme)
    end

    def results
      tape.to_binary
    end

    def run
      state_id = 1

      while true
        square = head.read(tape)
        state = states_register.find!(state_id)
        command = state.match!(square)

        command.run!(head: head, tape: tape)

        if command.final?
          break
        else
          state_id = command.next_state_id
        end
      end
    end

    private

    attr_reader :head, :tape, :states_register
  end
end
