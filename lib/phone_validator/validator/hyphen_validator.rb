module PhoneValidator
  module Validator
    class HyphenValidator
      attr_accessor :subject

      def initialize(subject = nil, next_validator = nil)
        @subject = subject
        @next = next_validator
      end

      def supported?
        (@subject =~ (/(-)+/))
      end

      def validate
        unless supported?
          raise 'No supporting validator registered' unless @next
          return @next.validate
        end
        if @subject.match /[a-zA-Z]/
          raise ValidationError.new 'hypen is not allowed while using alphabets'
        end
        initial_code_regex = /^(\(*)(0800|0508|0900)(\)*)/
        area_code_regex = /^(((02)(?!1|2|5|7))|(0[3-9]))/
        mobile_regex = /^(021|022|027|025)/
        target = ''
        formatted = Formatter::NoiseFormatter.new.format(@subject)
        formatted_with_hypen = Formatter::NoiseFormatter.new(['-'], nil).format(@subject)
        if !(code_match = formatted.match(initial_code_regex)).nil?
          target = code_match[2]
        elsif !(area_match = formatted.match(area_code_regex)).nil?
          target = area_match[1]
        elsif !(mobile_match = formatted.match(mobile_regex)).nil?
          target = mobile_match[1]
        end

        case target
          when '0508', '0800'
            if formatted.split(target)[1].length == 8
              valid = (formatted_with_hypen.index('-') == 8)
            else
              valid = (formatted_with_hypen.index('-') == 7)
            end
          when '0900'
            if formatted.split(target)[1].length == 5
              valid = (formatted_with_hypen.index('-').nil?)
            elsif (6..7).include? formatted.split(target)[1].length
              valid = (formatted_with_hypen.index('-') == 7)
            else
              valid = (formatted_with_hypen.index('-') == 8)
            end
          when '021'
            if formatted.split(target)[1].length == 8
              valid = (formatted_with_hypen.index('-') == 7)
            else
              valid = (formatted_with_hypen.index('-') == 6)
            end
          when '02', '03', '04', '06', '07', '09'
            valid = (formatted_with_hypen.index('-') == 5)
          when '022', '027', '025'
            valid = (formatted_with_hypen.index('-') == 6)
          else
            valid = false
        end

        unless valid
          raise ValidationError.new 'invalid format with hyphen'
        end
        @next.validate if @next
      end
    end
  end
end