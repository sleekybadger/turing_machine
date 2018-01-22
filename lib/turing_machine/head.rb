module TuringMachine
  class Head
    def initialize
      @position = 0
    end

    def move_left
      self.position = self.position - 1
    end

    def move_right
      self.position = self.position + 1
    end

    def read(tape)
      tape.get(position)
    end

    def write(tape, square)
      tape.replace(position, square)
    end

    protected

    attr_accessor :position
  end
end
