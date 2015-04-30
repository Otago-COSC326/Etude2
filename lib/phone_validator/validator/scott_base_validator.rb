module PhoneValidator
  module Validator
    class ScottBaseValdiator

      attr_accessor :subject

      def initialize(subject = nil, next_validator = nil)
        @subject = subject
        @next = next_validator
      end

      def supported?
        valid = (!(@subject =~ /^02(?!1|2|5|7)/).nil? && @subject.start_with?('02'))
        valid
      end

      def validate
        unless supported?
          raise 'No supporting validator registered' unless @next
          return @next.validate
        end
        target = Formatter::NoiseFormatter.new.format @subject
        valid = target.start_with? '02409'
        unless valid
          raise ValidationError.new 'firt digit after initial must be 409'
        end
        @next.validate if @next
      end
    end
  end
end