module TuringMachine
  class Tape
    def initialize
      @squares = []
    end

    def get(position)
      squares[position] || Square.new
    end

    def write(square)
      squares << square
    end
    alias_method :<<, :write

    def replace(position, square)
      squares[position] = square
    end

    def to_binary
      squares.map(&:value).compact.join('')
    end

    private

    attr_reader :squares
  end
end
