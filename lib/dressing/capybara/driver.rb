module Dressing
  module Capybara
    class Driver < ::Capybara::Selenium::Driver
      def initialize(app, options = {})
        options.merge!(
          browser: :remote,
          url: Dressing.configuration.remote_url
        )
        super
      end

      def session_id
        browser.__send__(:bridge).session_id
      end
    end
  end
end
