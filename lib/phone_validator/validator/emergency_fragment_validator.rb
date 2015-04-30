module PhoneValidator
  module Validator
    class EmergencyFragmentValidator

      attr_accessor :subject

      def initialize(subject = nil, next_validator = nil)
        @subject = subject
        @next = next_validator
      end

      def supported?
        subject = Formatter::NoiseFormatter.new.format(@subject)
        valid = subject.start_with?('03', '04', '06', '07', '09')
        # $validator_log.info "EmergencyFragmentValidator => not supported : #{@subject}" unless valid
        valid
      end

      def validate
        subject = Formatter::NoiseFormatter.new.format(@subject)
        unless supported?
          raise 'No supporting validator registered' unless @next
          return @next.validate
        end
        valid = !subject.start_with?(
            '03900', '04900', '06900', '07900', '09900',
            '03911', '04911', '06911', '07911', '09911',
            '03999', '04999', '06999', '07999', '09999'
        )
        unless valid
          raise ValidationError.new "#{@subject} INV"
        end
        @next.validate if @next
      end
    end
  end
end