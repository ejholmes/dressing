module Dressing
  module Capybara
    class Session < ::Capybara::Session
      attr_reader :driver

      def initialize(driver)
        @driver = driver
        super nil, driver.app
      end
    end
  end
end
