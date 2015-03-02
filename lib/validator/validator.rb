require 'validator/validation_error'
require 'validator/length_validator'
require 'validator/parentheses_validator'
require 'validator/letter_validator'
require 'validator/hyphen_validator'
require 'validator/nil_validator'
require 'source'
require 'logger'

module Validator

  def self.validate(subject)
    hyphen_validator = HyphenValidator.new(subject, NilValidator.new)
    letter_validator = LetterValidator.new(subject, hyphen_validator)
    parenthese_validator = ParentheseValidator.new  subject, letter_validator
    length_validator = LengthValidator.new subject, 9, 13, parenthese_validator
    length_validator.validate
  end


end
