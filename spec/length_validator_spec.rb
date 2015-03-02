require 'validator/length_validator'
require 'source'

module Validator
  describe Validator::LengthValidator do

    it 'should be valid if start with 0508 and have 6 digits' do
      validator = LengthValidator.new
      validator.subject = '0508 123456'
      expect {validator.validate}.not_to raise_error

      validator.subject = '0508 1234567'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '0508 12345'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 0800 and have 6 digits' do
      validator = LengthValidator.new
      validator.subject = '0800 123456'
      expect {validator.validate}.not_to raise_error

      validator.subject = '0800 12345678'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '0800 12345'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 0800 and have 7 digits' do
      validator = LengthValidator.new
      validator.subject = '0800 1234567'
      expect {validator.validate}.not_to raise_error

      validator.subject = '0800 12345678'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '0800 12345'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 0900 and have 5 digits' do
      validator = LengthValidator.new
      validator.subject = '0900 12345'
      expect {validator.validate}.not_to raise_error

      validator.subject = '0900 123456'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '0900 1234'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 02 and have 7 digits' do
      validator = LengthValidator.new
      validator.subject = '02 9234567'
      expect {validator.validate}.not_to raise_error

      validator.subject = '02 92345678'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '02 923456'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 03 and have 7 digits' do
      validator = LengthValidator.new
      validator.subject = '03 9234567'
      expect {validator.validate}.not_to raise_error

      validator.subject = '03 92345678'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '03 923456'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 04 and have 7 digits' do
      validator = LengthValidator.new
      validator.subject = '04 9234567'
      expect {validator.validate}.not_to raise_error

      validator.subject = '04 92345678'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '04 923456'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 06 and have 7 digits' do
      validator = LengthValidator.new
      validator.subject = '06 9234567'
      expect {validator.validate}.not_to raise_error

      validator.subject = '06 92345678'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '06 923456'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 07 and have 7 digits' do
      validator = LengthValidator.new
      validator.subject = '07 9234567'
      expect {validator.validate}.not_to raise_error

      validator.subject = '07 92345678'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '07 923456'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 09 and have 7 digits' do
      validator = LengthValidator.new
      validator.subject = '09 9234567'
      expect {validator.validate}.not_to raise_error

      validator.subject = '09 92345678'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '09 923456'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 021 and have 6 digits' do
      validator = LengthValidator.new
      validator.subject = '021 123456'
      expect {validator.validate}.not_to raise_error

      validator.subject = '021 12345'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '021 123456789'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 021 and have 7 digits' do
      validator = LengthValidator.new
      validator.subject = '021 1234567'
      expect {validator.validate}.not_to raise_error

      validator.subject = '021 12345'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '021 123456789'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 021 and have 8 digits' do
      validator = LengthValidator.new
      validator.subject = '021 12345678'
      expect {validator.validate}.not_to raise_error

      validator.subject = '021 12345'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '021 123456789'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 022 and have 7 digits' do
      validator = LengthValidator.new
      validator.subject = '022 1234567'
      expect {validator.validate}.not_to raise_error

      validator.subject = '022 123456'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '022 12345678'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 027 and have 7 digits' do
      validator = LengthValidator.new
      validator.subject = '027 1234567'
      expect {validator.validate}.not_to raise_error

      validator.subject = '027 123456'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '027 12345678'
      expect {validator.validate}.to raise_error ValidationError
    end

    it 'should be valid if start with 025 and have 6 digits' do
      validator = LengthValidator.new
      validator.subject = '025 123456'
      expect {validator.validate}.not_to raise_error

      validator.subject = '025 12345'
      expect {validator.validate}.to raise_error ValidationError

      validator.subject = '025 1234567'
      expect {validator.validate}.to raise_error ValidationError
    end
  end
end