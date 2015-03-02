require 'validator/validator'
require 'source'

module Validator
  describe Validator::LetterValidator do

    describe 'supported?' do
      it 'should support if number starts with 0800 or (0800) and contains alphabets' do
        validator = LetterValidator.new
        validator.subject = '0800ABC1D34'
        expect(validator.supported?).to be_truthy

        validator.subject = '(0800)0800ABC1D34'
        expect(validator.supported?).to be_truthy
      end

      it 'should support if number starts with 0800 or (0800) but does not contain alphabets' do
        validator = LetterValidator.new
        validator.subject = '0800'
        expect(validator.supported?).to be_falsey

        validator.subject = '0800 12345'
        expect(validator.supported?).to be_falsey

        validator.subject = '(0800) 12345'
        expect(validator.supported?).to be_falsey
      end

    end

    describe 'validate' do

      describe '0800' do
        it 'should be valid if number = 0800 12345A' do
          validator = LetterValidator.new
          validator.subject = '0800 12345A'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0800 12345AB' do
          validator = LetterValidator.new
          validator.subject = '0800 12345AB'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0800 12345ABC' do
          validator = LetterValidator.new
          validator.subject = '0800 12345ABC'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0800 12345ABCD' do
          validator = LetterValidator.new
          validator.subject = '0800 12345ABCD'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0800 ABCDEFGHI' do
          validator = LetterValidator.new
          validator.subject = '0800 ABCDEFGHI'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0800 ABCDEFG89' do
          validator = LetterValidator.new
          validator.subject = '0800 ABCDEFG89'
          expect {validator.validate}.to raise_exception ValidationError
        end

        it 'should be valid if number = 0800 1B3A4ABCD' do
          validator = LetterValidator.new
          validator.subject = '0800 1B3A4ABCD'
          expect {validator.validate}.not_to raise_exception
        end
      end

      describe '0508' do
        it 'should be valid if number = 0508 12345A' do
          validator = LetterValidator.new
          validator.subject = '0508 12345A'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0508 123456ABC' do
          validator = LetterValidator.new
          validator.subject = '0508 123456ABC'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0508 ABC12D' do
          validator = LetterValidator.new
          validator.subject = '0508 ABC12D'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0508 ABCDETCGH' do
          validator = LetterValidator.new
          validator.subject = '0508 ABCDETCGH'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0508 ABCDEF7HG' do
          validator = LetterValidator.new
          validator.subject = '0508 ABCDEF7HG'
          expect {validator.validate}.to raise_exception ValidationError
        end

        it 'should be valid if number = 0508 ABCDE666' do
          validator = LetterValidator.new
          validator.subject = '0508 ABCDE666'
          expect {validator.validate}.to raise_exception ValidationError
        end
      end

      describe '0900' do
        it 'should be valid if number = 0900 12345A' do
          validator = LetterValidator.new
          validator.subject = '0900 12345A'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0900 12345ABCD' do
          validator = LetterValidator.new
          validator.subject = '0900 12345ABCD'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0900 ABC12' do
          validator = LetterValidator.new
          validator.subject = '0900 ABC12'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0508 ABCDETCGH' do
          validator = LetterValidator.new
          validator.subject = '0508 ABCDETCGH'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0900 ABC7DERT' do
          validator = LetterValidator.new
          validator.subject = '0900 ABC7DERT'
          expect {validator.validate}.not_to raise_exception
        end

        it 'should be valid if number = 0900 ABC7DERT7' do
          validator = LetterValidator.new
          validator.subject = '0900 ABC7DERT7'
          expect {validator.validate}.to raise_exception ValidationError
        end

        it 'should be valid if number = 0900 ABC7DE777' do
          validator = LetterValidator.new
          validator.subject = '0900 ABC7DE777'
          expect {validator.validate}.to raise_exception ValidationError
        end
      end

    end

  end
end