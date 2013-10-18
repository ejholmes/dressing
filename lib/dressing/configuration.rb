module Dressing
  class Configuration
    attr_accessor :browser
    attr_accessor :os
    attr_accessor :version

    attr_accessor :username
    attr_accessor :access_key

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
