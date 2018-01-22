module TuringMachine
  module CommandRunners
    class Base
      def call!(head:, tape:, value:)
        raise NotImplementedError
      end
    end
  end
end
