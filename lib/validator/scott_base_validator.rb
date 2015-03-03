require 'source'

module Validator

  class ScottBaseValdiator

    attr_accessor :subject

    def initialize(subject = nil, next_validator = nil)
      @subject = subject
      @next = next_validator
    end

    def supported?
      valid = (!(@subject =~ /^02(?!1|2|5|7)/).nil? && @subject.start_with?('02'))
      # $validator_log.info "ScottBaseValdiator => not supported : #{@subject}" unless valid
      valid
    end

    def validate
      unless supported?
        raise 'No supporting validator registered' unless @next
        return @next.validate
      end
      target = Formatter::NoiseFormatter.new.format @subject
      valid = target.start_with? '02409'
      unless valid
        # $validator_log.error "ScottBaseValdiator => subject : #{@subject}, Validation Failed"
        raise ValidationError.new "#{@subject} INV"
      end
      @next.validate if @next
    end
  end
end