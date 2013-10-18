module Dressing
  module Runner
    class Base
      attr_reader :example

      def self.run(*args)
        new(*args).run
      end

      def initialize(example)
        @example = example
      end

      def run
        Dressing.current_session = Capybara::Session.new driver
        run_example
      end

      def run_example
        raise NotImplementedError
      end

    private

      def app
        Dressing.app
      end

      def driver
        @driver ||= Capybara::Driver.new app, desired_capabilities: capabilities
      end

      def capabilities
        capabilities_class.new(example).to_h
      end

      def capabilities_class
        klass = :"#{self.class.to_s.gsub(/.*::/, '')}"
        Capabilities.const_get klass
      end

    end
  end
end
