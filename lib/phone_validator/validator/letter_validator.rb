module PhoneValidator
  module Validator
    class LetterValidator
      attr_accessor :subject

      def initialize(subject = nil, next_validator = nil)
        @subject = subject
        @next = next_validator
      end

      def supported?
        target = @subject.split(/^(\(*)(0800|0508|0900)(\)*)/)[4]
        supported = !(target =~ /[a-zA-Z]+/).nil?
        # $validator_log.info "LetterValidator => not supported : #{@subject}" unless supported
        supported
      end

      def validate
        unless supported?
          raise 'No supporting validator registered' unless @next
          return @next.validate
        end
        valid = true
        target =  Formatter::NoiseFormatter.new.format @subject
        length = target.length
        if target.start_with?('0800')
          if length > 11
            valid = !(target.match("[a-zA-Z]{#{length - 11}}$")).nil?
          end
        elsif target.start_with?('0508')
          if length > 10
            valid = !(target.match"[a-zA-Z]{#{length - 10}}$").nil?
          end
        elsif target.start_with?('0900')
          if length > 9
            valid = !(target.match"[a-zA-Z]{#{length - 9}}$").nil?
          end
        end
        unless valid
          raise ValidationError.new "#{@subject} INV"
        end
        @next.validate if @next
      end
    end
  end
end