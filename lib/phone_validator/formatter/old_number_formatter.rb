module PhoneValidator
  module Formatter

    class OldNumberFormatter

      def initialize( next_formatter = nil)
        @next = next_formatter
      end

      def supported?(subject)
        supported = subject.start_with?('025')
        # $formatter_log.info "HyphenValidator => not supported : #{subject}" unless supported
        supported
      end

      def format(subject)
        target = NoiseFormatter.new.format subject
        target = target.sub('025', '0274')
        # $formatter_log.info "OldNumberFormatter => Formatted : #{target}" unless target
        target
      end
    end
  end
end