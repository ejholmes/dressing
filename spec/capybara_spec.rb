require 'spec_helper'
require 'capybara/rspec'
require 'dressing/rspec'

def app
  lambda { |env| [200, {'Content-Type' => 'text/html'}, ['<body><h1>Hello world</h1></body>']] }
end

Capybara.app = app
Capybara.server_port = 9999

describe 'page' do
  it 'runs the page on sauce labs' do
    visit '/'
    expect(page).to have_content 'Hello world'
  end
end
