module Dressing
  module Capabilities
    class Base
      attr_reader :example

      def initialize(example)
        @example = example
      end

      def to_h
        { 'job-name' => job_name }.merge(configuration.to_capabilities)
      end

      def job_name
        raise NotImplementedError
      end

    private

      def configuration
        Dressing.configuration
      end

    end
  end
end
