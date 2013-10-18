require 'sauce_whisk'

module Dressing
  module Runner
    class Base
      attr_reader :test

      def self.run(*args)
        new(*args).run
      end

      def initialize(test)
        @test = test
      end

      def run
        Dressing.current_session = Capybara::Session.new driver
        run_test
      ensure
        driver.quit
        update_status
      end

      def run_test
        raise NotImplementedError
      end

      def passed?
        raise NotImplementedError
      end

    private

      def app
        Dressing.app
      end

      def driver
        @driver ||= Capybara::Driver.new app, desired_capabilities: capabilities
      end

      def session_id
        driver.session_id
      end

      def update_status
        SauceWhisk::Jobs.change_status driver.session_id, passed?
      end

      def capabilities
        capabilities_class.new(test).to_h
      end

      def capabilities_class
        klass = :"#{self.class.to_s.gsub(/.*::/, '')}"
        Capabilities.const_get klass
      end

    end
  end
end
