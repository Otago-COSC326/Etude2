module PhoneValidator
  module Validator
    class LowercaseValidator

      attr_accessor :subject

      def initialize(subject = nil, next_validator = nil)
        @subject = subject
        @next = next_validator
      end

      def supported?
        !@subject.match(/[a-zA-Z]/).nil?
      end

      def validate
        unless supported?
          raise 'No supporting validator registered' unless @next
          return @next.validate
        end
        if @subject.match /[a-z]/
          raise ValidationError.new 'letter must be uppercase'
        end
        @next.validate if @next
      end
    end
  end
end