require 'validator/validator'
require 'source'

module Validator
  describe Validator::LetterValidator do

    describe 'supported?' do
      it 'should support if number starts with 0800 or (0800)' do
        validator = LetterValidator.new
        validator.subject = '0800'
        expect {validator.supported?}.not_to raise_error
        validator.subject = '(0800)'
        expect {validator.supported?}.not_to raise_error
      end

      it 'should support if number starts with 0508 or (0508)' do
        validator = LetterValidator.new
        validator.subject = '0508'
        expect {validator.supported?}.not_to raise_error
        validator.subject = '(0508)'
        expect {validator.supported?}.not_to raise_error
      end

      it 'should support if number starts with 0900 or (0900)' do
        validator = LetterValidator.new
        validator.subject = '0900'
        expect {validator.supported?}.not_to raise_error
        validator.subject = '(0900)'
        expect {validator.supported?}.not_to raise_error
      end

      it 'should not support if number not start with 0800, 0508 or 0900' do
        validator = LetterValidator.new
        validator.subject = '34324'
        expect(validator.supported?).to be_falsey
        validator.subject = '(2342)'
        expect(validator.supported?).to be_falsey
      end
    end

    describe 'validate' do
      describe '0800' do
        it 'should be valid when 0800123456ABCDEFGHI' do
          validator = LetterValidator.new
          validator.subject = '0800123456ABCDEFGHI'
          expect {validator.validate}.not_to raise_error
        end

        it 'should be invalid when 08001234567ABCDEFGHIJ' do
          validator = LetterValidator.new
          validator.subject = '08001234567ABCDEFGHIJ'
          expect {validator.validate}.to raise_error ValidationError
        end

        it 'should be valid when #digits == 6 [0800 123456]' do
          validator = LetterValidator.new
          validator.subject = '0800 123456'
          expect {validator.validate}.not_to raise_error
        end

        it 'should be valid when #digits == 7 [0800 1234567]' do
          validator = LetterValidator.new
          validator.subject = '0800 1234567'
          expect {validator.validate}.not_to raise_error
        end

        it 'should be invalid when #digits > 7 digits [0800 12345678]' do
          validator = LetterValidator.new
          validator.subject = '0800 12345678'
          expect {validator.validate}.to raise_error ValidationError
        end

        it 'should be valid when #letters == 0 [0800 1234567]' do
          validator = LetterValidator.new
          validator.subject = '0800 1234567'
          expect {validator.validate}.not_to raise_error
        end

        it 'should be valid when #letters <= 9 [0800 1234567ABCDEFGHS]' do
          validator = LetterValidator.new
          validator.subject = '0800 1234567ABCDEFGHS'
          expect {validator.validate}.not_to raise_error
        end

        it 'should be invalid when #letters > 9 [0800 1234567ABCDEFGHST]' do
          validator = LetterValidator.new
          validator.subject = '0800 1234567ABCDEFGHST'
          expect {validator.validate}.to raise_error ValidationError
        end
      end

      describe '0508' do
        it 'should be valid when 0508123456ABCDEFGHI' do
          validator = LetterValidator.new
          validator.subject = '0508123456ABCDEFGHI'
          expect {validator.validate}.not_to raise_error
        end

        it 'should be valid when 05081234567ABCDEFGHI' do
          validator = LetterValidator.new
          validator.subject = '05081234567ABCDEFGHI'
          expect {validator.validate}.to raise_error ValidationError
        end

        it 'should be valid when 0508123456ABCDEFGHIJ' do
          validator = LetterValidator.new
          validator.subject = '0508123456ABCDEFGHIJ'
          expect {validator.validate}.to raise_error ValidationError
        end

        it 'should be valid when #digits == 6 [0508 123456]' do
          validator = LetterValidator.new
          validator.subject = '0508 123456'
          expect {validator.validate}.not_to raise_error
        end

        it 'should be valid when #digits == 0 [0508 TTTT]' do
          validator = LetterValidator.new
          validator.subject = '0508 TTTT'
          expect {validator.validate}.not_to raise_error
        end
      end

      describe '0900' do
        it 'should be valid when 090012345ABCDEFGHI' do
          validator = LetterValidator.new
          validator.subject = '090012345ABCDEFGHI'
          expect {validator.validate}.not_to raise_error
        end

        it 'should be valid when 0900123456ABCDEFGHI' do
          validator = LetterValidator.new
          validator.subject = '0900123456ABCDEFGHI'
          expect {validator.validate}.to raise_error ValidationError
        end

        it 'should be valid when 090012345ABCDEFGHIJ' do
          validator = LetterValidator.new
          validator.subject = '090012345ABCDEFGHIJ'
          expect {validator.validate}.to raise_error ValidationError
        end

        it 'should be valid when #digits == 5 [0900 12345]' do
          validator = LetterValidator.new
          validator.subject = '0900 12345'
          expect {validator.validate}.not_to raise_error
        end

        it 'should be valid when #digits == 0 [0900 TTTT]' do
          validator = LetterValidator.new
          validator.subject = '0900 TTTT'
          expect {validator.validate}.not_to raise_error
        end
      end
    end
  end
end