require 'source'

module Validator
  class LetterValidator
    attr_accessor :subject

    def initialize(subject = nil, next_validator = nil)
      @subject = subject
      @next = next_validator
    end

    def supported?
      valid = @subject =~ (/^(\(*)(0800|0508|0900)(\)*)/)
      $validator_log.info "LetterValidator => not supported : #{@subject}" unless valid
      valid
    end

    def validate
      unless supported?
        raise 'No supporting validator registered' unless @next
        return @next.validate
      end
      case
        when @subject.match(/^(\(*)0800(\)*)/)
          valid = !(@subject =~ /^(\(*)0800(\)*)(\s)*[0-9]{0,7}[a-zA-Z]{0,9}$/).nil?
        when @subject.match(/^(\(*)(0508)(\)*)/)
          valid = !(@subject. =~ /^(\(*)0508(\)*)(\s)*[0-9]{0,6}[a-zA-Z]{0,9}$/).nil?
        when @subject.match(/^(\(*)0900(\)*)/)
          valid = !(@subject =~ /^(\(*)0900(\)*)(\s)*[0-9]{0,5}[a-zA-Z]{0,9}$/).nil?
        else
          valid = false
      end
      unless valid
        $validator_log.error "LetterValidator => subject : #{@subject}, Validation Failed"
        raise ValidationError.new "#{@subject} INV"
      end
      @next.validate if @next
    end
  end
end