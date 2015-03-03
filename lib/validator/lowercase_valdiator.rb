require 'source'

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
        # $validator_log.error "LowercaseValidator => subject : #{@subject}, Validation Failed"
        raise ValidationError.new "#{@subject} INV"
      end
      @next.validate if @next
    end
  end
end