require 'dressing/version'

module Dressing
  autoload :Configuration, 'dressing/configuration'
  autoload :RSpec, 'dressing/rspec'

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

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end
end
