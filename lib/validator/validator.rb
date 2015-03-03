require 'validator/validation_error'
require 'validator/length_validator'
require 'validator/parentheses_validator'
require 'validator/letter_validator'
require 'validator/hyphen_validator'
require 'validator/nil_validator'
require 'validator/scott_base_validator'
require 'validator/emergency_fragment_validator'
require 'validator/space_validator'
require 'source'

module Validator

  def self.validate(subject)
    emergency_fragment_valdator = EmergencyFragmentValidator.new(subject, NilValidator.new)
    scott_valdiator = ScottBaseValdiator.new(subject, emergency_fragment_valdator)
    hyphen_validator = HyphenValidator.new(subject, scott_valdiator)
    space_validator = SpaceValidator.new(subject, hyphen_validator)
    letter_validator = LetterValidator.new(subject, space_validator)
    parenthese_validator = ParentheseValidator.new  subject, letter_validator
    length_validator = LengthValidator.new subject, parenthese_validator
    length_validator.validate
  end

end
