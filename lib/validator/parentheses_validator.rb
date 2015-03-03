require 'source'

module Validator
  class ParentheseValidator
    attr_accessor :subject

    def initialize(subject = nil, next_validator = nil)
      @subject = subject
      @next = next_validator
    end

    def supported?
      valid = @subject =~ (/^(\()|(\))/)
      # $validator_log.info "ParentheseValidator => not supported : #{@subject}" unless valid
      valid
    end

    def validate
      unless supported?
        raise 'No supporting validator registered' unless @next
        return @next.validate
      end
      unless @subject =~ /\(\d{2,4}\)/
        # $validator_log.error "ParentheseValidator => subject : #{@subject}, Validation Failed"
        raise ValidationError.new "#{@subject} INV"
      end
      @next.validate if @next
    end
  end
end