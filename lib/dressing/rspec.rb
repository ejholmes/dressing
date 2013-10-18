require 'rspec'
require 'capybara/rspec'

module Dressing
  module RSpec
    def page
      Dressing.current_session
    end

    def self.included(config)
      config.around { |example| Runner::RSpec.run example }
    end

    ::RSpec.configure do |config|
      config.include ::Capybara::DSL
      config.include self
    end
  end
end
