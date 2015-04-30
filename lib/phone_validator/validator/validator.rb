module PhoneValidator
  module Validator
      def self.validate(subject)
        emergency_fragment_valdator = EmergencyFragmentValidator.new(subject, NilValidator.new)
        scott_valdiator = ScottBaseValdiator.new(subject, emergency_fragment_valdator)
        hyphen_validator = HyphenValidator.new(subject, scott_valdiator)
        space_validator = SpaceValidator.new(subject, hyphen_validator)
        letter_validator = LetterValidator.new(subject, space_validator)
        parenthese_validator = ParentheseValidator.new  subject, letter_validator
        lowercase_validator = LowercaseValidator.new  subject, parenthese_validator
        length_validator = LengthValidator.new subject, lowercase_validator
        length_validator.validate
      end
  end

end