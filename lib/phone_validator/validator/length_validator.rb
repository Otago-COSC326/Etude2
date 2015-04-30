module PhoneValidator
  module Validator
    class LengthValidator
      attr_accessor :subject

      def initialize(subject = nil,
                     next_validator = nil)
        @subject = subject
        @next = next_validator
      end

      def supported?
        true
      end

      def validate
        target = Formatter::NoiseFormatter.new.format @subject
        valid = false
        if target.start_with?('0508')
          if target.match(/[a-zA-Z]+/)
            valid = ((4..13).include?(target.length))
          else
            valid = (target.length == 10)
          end
        elsif target.start_with?('0800')
          if target.match(/[a-zA-Z]+/)
            valid = ((4..13).include?(target.length))
          else
            valid = ([10, 11].include?(target.length))
          end
        elsif target.start_with?('0900')
          if target.match(/[a-zA-Z]+/)
            valid = ((4..13).include?(target.length))
          else
            valid = (target.length == 9)
          end
        elsif target.start_with?('021')
          valid = ((9..11).include?(target.length))
        elsif target.start_with?('022', '027')
          valid = (target.length == 10)
        elsif target.start_with?('025')
          valid = (target.length == 9)
        elsif target.start_with?('02', '03', '04', '06', '07', '09')
          valid = (target.length == 9)
        end
        unless valid
          raise ValidationError.new 'invalid length'
        end
        @next.validate if @next
      end
    end
  end
end