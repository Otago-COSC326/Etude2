module PhoneValidator
  module Formatter
    def self.format(subject)
      target = subject.dup
      target = NoiseFormatter.new.format(target)
      target = OldNumberFormatter.new.format(target)
      target = LetterToNumberFormatter.new.format(target)
      target = WhiteSpaceFormatter.new.format(target)
      target
    end

  end
end