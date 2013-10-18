require 'spec_helper'
require 'capybara/rspec'
require 'dressing/rspec'

def app
  lambda { |env| [200, {'Content-Type' => 'text/html'}, ['<body><h1>Hello world</h1><a href="#">Button</a></body>']] }
end

Capybara.app = app
Capybara.server_port = 9999

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Dressing::RSpec
end

describe 'page' do
  2.times do |i|
    it "runs the page on sauce labs ##{i}" do
      visit '/'
      expect(page).to have_content 'Hello world'
    end
  end

  it 'clicks buttons' do
    visit '/'
    click_on 'Button'
  end
end
