require 'rspec'
require 'capybara/rspec'

module Dressing
  module RSpec
    def page
      Dressing.current_session
    end

    def self.included(config)
      config.around { |test| Runner::RSpec.run test, example }
    end
  end
end
