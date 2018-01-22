require_relative './base'

module TuringMachine
  module CommandRunners
    class Write < Base
      def call!(head:, tape:, value:)
        square = Square.new(value)
        head.write(tape, square)
      end
    end
  end
end
