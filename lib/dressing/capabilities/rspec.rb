module Dressing
  module Capabilities
    class RSpec < Base

      def job_name
        metadata[:full_description]
      end

    private

      def metadata
        example.metadata
      end

    end
  end
end
