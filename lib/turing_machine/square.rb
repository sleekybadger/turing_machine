module TuringMachine
  class Square
    attr_reader :value

    def initialize(value = nil)
      @value = value
    end

    def empty?
      value.nil?
    end

    def filled?
      !empty?
    end

    def ==(square)
      value == square.value
    end
  end
end
