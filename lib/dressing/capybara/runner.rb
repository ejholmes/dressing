module Dressing
  module Capybara
    class Runner
      attr_reader :example

      def self.run(*args)
        new(*args).run
      end

      def initialize(example)
        @example = example
      end
    
      def run
        Dressing.current_session = Session.new driver
        example.run
      end

    private

      def driver
        @driver ||= Driver.new app, desired_capabilities: Capabilities.new(example).to_h
      end

      def app
        Dressing.app
      end

    end
  end
end
