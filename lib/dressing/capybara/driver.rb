module Dressing
  module Capybara
    class Driver < ::Capybara::Selenium::Driver
      RETRY_ON = [
        ::Selenium::WebDriver::Error::UnhandledError,
        ::Selenium::WebDriver::Error::UnknownError
      ]

      MAX_RETRIES = 3

      RETRY_METHODS = [
        :visit, :current_url, :reset!, :within_frame, :within_window,
        :find_window, :execute_script, :evaluate_script, :find_css, :find_xpath,
        :html
      ]

      RETRY_METHODS.each do |name|
        alias_method :"_base_#{name}", name

        define_method name do |*args, &block|
          retries = MAX_RETRIES

          begin
            __send__(:"_base_#{name}", *args, &block)
          rescue *RETRY_ON => e
            if retries > 0
              retries -= 1
              puts "Received an exception (#{e}), retrying."
              retry
            end
            raise
          end
        end
      end

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
        return if @quit
        @quit = true
        super
      end
    end
  end
end
