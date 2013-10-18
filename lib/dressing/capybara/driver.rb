module Dressing
  module Capybara
    class Driver < ::Capybara::Selenium::Driver
      def initialize(app, options = {})
        options.merge!(
          url: Dressing.configuration.remote_url,
          http_client: Dressing.http_client
        )
        super
      end

      def browser
        @browser ||= Selenium::WebDriver.for(:remote, options.reject { |key,val| SPECIAL_OPTIONS.include?(key) })
      end

      def session_id
        browser.__send__(:bridge).session_id
      end
    end
  end
end
