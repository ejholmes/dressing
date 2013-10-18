module Dressing
  class Configuration
    attr_accessor :browser
    attr_accessor :os
    attr_accessor :version

    attr_accessor :username
    attr_accessor :access_key

    POTENTIAL_PORTS = [
        3000, 3001, 3030, 3210, 3333, 4000, 4001, 4040, 4321, 4502, 4503, 5000,
        5001, 5050, 5555, 5432, 6000, 6001, 6060, 6666, 6543, 7000, 7070, 7774,
        7777, 8000, 8001, 8003, 8031, 8080, 8081, 8765, 8888, 9000, 9001, 9080,
        9090, 9876, 9999, 49221, 55001, 80, 443, 888, 2000, 2001, 2020, 2109,
        2222, 2310
    ]

    SAUCE_OPTIONS = %w(record-video record-screenshots capture-html tags
        sauce-advisor single-window user-extensions-url firefox-profile-url
        max-duration idle-timeout build custom-data tunnel-identifier
        selenium-version command-timeout prerun prerun-args screen-resolution
        disable-popup-handler avoid-proxy public name)

    SAUCE_OPTIONS.each do |option|
      attr_accessor :"#{option.gsub('-', '_')}"
    end

    def initialize
      self.browser           = ENV['SAUCE_BROWSER'] || 'Chrome'
      self.os                = ENV['SAUCE_OS'] || 'Windows 7'
      self.version           = ENV['SAUCE_VERSION']

      self.username          = ENV['SAUCE_USERNAME']
      self.access_key        = ENV['SAUCE_ACCESS_KEY']

      self.tunnel_identifier = ENV['SAUCE_TUNNEL_IDENTIFIER'] || ENV['TRAVIS_JOB_NUMBER']
    end

    def remote_url
      "http://#{username}:#{access_key}@ondemand.saucelabs.com/wd/hub"
    end

    def to_capabilities
      { 'browserName' => browser,
        'platform' => os,
        'version' => version }.merge(
          Hash[SAUCE_OPTIONS.map { |option| [option, __send__(:"#{option.gsub('-', '_')}")] }]
        ).keep_if { |key, value| !value.nil? }
    end
  end
end
