module Dressing
  module Runner
    class RSpec < Base
      def run_example
        example.run
      end
    end
  end
end
