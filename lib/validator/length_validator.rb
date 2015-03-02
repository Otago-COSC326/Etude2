require 'source'

module Validator
  class LengthValidator
    attr_accessor :subject

    def initialize(subject = nil,
                   min = 9,
                   max = 13,
                   next_validator = nil)
      @min = min
      @max = max
      @subject = subject
      @next = next_validator
    end

    def supported?
      true
    end

    def validate
      target = @subject.rstrip.lstrip.gsub(/\s+/, '').gsub(/\(+/, '').gsub(/\)+/, '').gsub(/(-)+/, '')
      valid = false
      if target.start_with?('0508')
        valid = (target.length == 10)
      elsif target.start_with?('0800')
        valid = ([10, 11].include?(target.length))
      elsif target.start_with?('0900')
        valid = (target.length == 9)
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
        $validator_log.error "LengthValidator(#{@min}...#{@max}) => subject : #{@subject}, current length : #{@subject.length}"
        raise ValidationError.new "#{@subject} INV"
      end
      @next.validate if @next
    end
  end
end