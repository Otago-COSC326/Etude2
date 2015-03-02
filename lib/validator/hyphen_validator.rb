require 'source'

module Validator
  class HyphenValidator
    attr_accessor :subject

    def initialize(subject = nil, next_validator = nil)
      @subject = subject
      @next = next_validator
    end

    def supported?
      valid = (@subject =~ (/(-)+/))
      $validator_log.info "HyphenValidator => not supported : #{@subject}" unless valid
      valid
    end

    def validate
      unless supported?
        raise 'No supporting validator registered' unless @next
        return @next.validate
      end
      initial_code_regex = /^(\(*)(0800|0508|0900)(\)*)/
      area_code_regex = /^(((02)(?!1|2|5|7))|(0[3-9]))/
      mobile_regex = /^(021|022|027|025)/
      target = ''
      formatted = @subject.rstrip.lstrip.gsub(/\s+/, '').gsub(/\(+/, '').gsub(/\)+/, '').gsub(/(-)+/, '')
      formatted_with_hypen = @subject.rstrip.lstrip.gsub(/\s+/, '').gsub(/\(+/, '').gsub(/\)+/, '')
      if !(code_match = formatted.match(initial_code_regex)).nil?
        target = code_match[2]
      elsif !(area_match = formatted.match(area_code_regex)).nil?
        target = area_match[1]
      elsif !(mobile_match = formatted.match(mobile_regex)).nil?
        target = mobile_match[1]
      end

      # TODO: QUESTION => What happened if 0800,0508,0900 has 9 number when use with letter
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
        $validator_log.error "HyphenValidator => subject : #{@subject}, Validation Failed"
        raise ValidationError.new "#{@subject} INV"
      end
      @next.validate if @next
    end
  end
end