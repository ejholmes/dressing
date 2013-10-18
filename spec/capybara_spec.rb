require 'spec_helper'
require 'capybara/rspec'
require 'dressing/capybara/rspec'

def app
  lambda { |env| [200, {'Content-Type' => 'text/html'}, ['<body><h1>Hello world</h1></body>']] }
end

Capybara.app = app
Capybara.default_driver = :selenium

describe 'page' do
  it 'runs the page on sauce labs' do
    visit '/'
    expect(page).to have_content 'Hello world'
  end
end
