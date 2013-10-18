require 'selenium/webdriver'
require 'selenium/webdriver/remote/http/persistent'

require 'dressing/version'

module Dressing
  autoload :Configuration, 'dressing/configuration'
  autoload :RSpec, 'dressing/rspec'

  module Runner
    autoload :Base, 'dressing/runner/base'
    autoload :RSpec, 'dressing/runner/rspec'
  end

  module Capabilities
    autoload :Base, 'dressing/capabilities/base'
    autoload :RSpec, 'dressing/capabilities/rspec'
  end

  module Capybara
    autoload :Driver, 'dressing/capybara/driver'
    autoload :Session, 'dressing/capybara/session'
  end

  class << self
    attr_accessor :current_session

    def current_session
      @current_session ||= ::Capybara.current_session
    end

    def app
      ::Capybara.app
    end

    def http_client
      @http_client ||= begin
        client = Selenium::WebDriver::Remote::Http::Persistent.new
        client.timeout = configuration.http_timeout
        client
      end
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end
end
