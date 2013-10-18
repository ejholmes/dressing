module Dressing
  module RSpec
    class Capabilities
      attr_reader :example

      def initialize(example)
        @example = example
      end

      def to_h
        { 'job-name' => job_name }.merge(configuration.to_capabilities)
      end

    private

      def configuration
        Dressing.configuration
      end

      def job_name
        example.metadata[:full_description]
      end

    end
  end
end
