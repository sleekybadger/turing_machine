require_relative './state'

module TuringMachine
  class Register
    class NotFound < StandardError; end

    def initialize
      @states = []
    end

    def add(state)
      states << state
    end
    alias_method :<<, :add

    def find(id)
      states.find { |state| state.id == id }
    end

    def find!(id)
      state = find(id)
      raise NotFound,
            "Unable to find state with id #{id}" unless state
      state
    end

    private

    attr_reader :states
  end
end
