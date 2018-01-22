require_relative './base'

module TuringMachine
  module CommandRunners
    class Move < Base
      class UnsupportedDirection < StandardError; end

      def call!(head:, tape:, value:)
        case value
        when :left
          head.move_left
        when :right
          head.move_right
        else
          raise UnsupportedDirection, "Unable to move in direction #{value}"
        end
      end
    end
  end
end
