module PhoneValidator
  module Validator
    class ParentheseValidator
      attr_accessor :subject

      def initialize(subject = nil, next_validator = nil)
        @subject = subject
        @next = next_validator
      end

      def supported?
        valid = @subject =~ (/^(\()|(\))/)
        valid
      end

      def validate
        unless supported?
          raise 'No supporting validator registered' unless @next
          return @next.validate
        end
        unless @subject =~ /\(\d{2,4}\)/
          raise ValidationError.new 'invalid use of parentheses'
        end
        @next.validate if @next
      end
    end
  end
end