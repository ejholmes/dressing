module Dressing
  module Runner
    class RSpec < Base
      attr_reader :example

      def initialize(test, example)
        @example = example
        super test
      end

      def run_test
        test.run
      end

      def passed?
        example.exception.nil?
      end
    end
  end
end
