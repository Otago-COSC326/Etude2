require 'source'
require 'logger'
require 'formatter/old_number_formatter'
require 'formatter/letter_to_number_formatter'
require 'formatter/noise_formatter'
require 'formatter/white_space_formatter'


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