module Dressing
  module RSpec
    class Runner
      attr_reader :example

      def self.run(*args)
        new(*args).run
      end

      def initialize(example)
        @example = example
      end
    
      def run
        Dressing.current_session = Capybara::Session.new driver
        example.run
      end

    private

      def driver
        @driver ||= Capybara::Driver.new app, desired_capabilities: Capabilities.new(example).to_h
      end

      def app
        Dressing.app
      end

    end
  end
end
