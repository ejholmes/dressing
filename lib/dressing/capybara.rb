Capybara.register_driver :sauce do |app|
  Dressing::Capybara::Driver.new(app, desired_capabilities: Dressing.configuration.to_capabilities)
end
