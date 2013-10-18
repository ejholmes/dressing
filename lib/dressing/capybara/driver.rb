module Dressing
  module Capybara
    class Driver < ::Capybara::Selenium::Driver
      def initialize(app, options = {})
        options.merge!(
          browser: :remote,
          url: Dressing.configuration.remote_url,
          http_client: Dressing.http_client
        )
        super
      end

      def session_id
        browser.__send__(:bridge).session_id
      end

      def quit
        super
      rescue StandardError => e
        # Whatevs
      end
    end
  end
end
