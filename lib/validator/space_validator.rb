require 'source'

module Validator
  class SpaceValidator

    attr_accessor :subject

    def initialize(subject = nil, next_validator = nil)
      @subject = subject
      @next = next_validator
    end

    def supported?
      @subject.match(/(\s)+/) && !@subject.include?('-') && !@subject.match(/[a-zA-Z]/)
    end

    def validate
      unless supported?
        raise 'No supporting validator registered' unless @next
        return @next.validate
      end
      target = @subject.dup
      target = Formatter::NoiseFormatter.new(['\s']).format target
      case
        when target.start_with?('0800', '0508')
          valid = !((target =~ /^(0800|0508)(\s)(\d){3}(\s)(\d){3,4}$/).nil?)
        when target.start_with?('0900')
          valid = (target.count(' ') == 1)
        when target.start_with?('021')
          if [9, 10].include? (Formatter::NoiseFormatter.new.format(subject).length)
            valid = !((target =~ /^021(\s)(\d){3}(\s)(\d){3,4}$/).nil?)
          elsif Formatter::NoiseFormatter.new.format(subject).length == 11
            valid = !((target =~ /^021(\s)(\d){4}(\s)(\d){4}$/).nil?)
          else
            valid = false
          end
        when target.start_with?('022', '027', '025')
          valid = !((target =~ /^(022|027|025)(\s)(\d){3}(\s)(\d){3,4}$/).nil?)
        when target.start_with?('02')
          valid = !((target =~ /^02(?!(\s)?1|(\s)?2|(\s)?5|(\s)?7)(\s)(\d){3}(\s)(\d){4}$/).nil?)
        when target.start_with?('03', '04', '06', '07', '09')
          valid = !((target =~ /^(03|04|06|07|09)(\s)(\d){3}(\s)(\d){4}$/).nil?)
        else
          valid = false
      end
      unless valid
        # $validator_log.error "SpaceValidator => subject : #{@subject}, Validation Failed"
        raise ValidationError.new "#{@subject} INV"
      end
      @next.validate if @next
    end
  end
end