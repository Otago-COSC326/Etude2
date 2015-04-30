module PhoneValidator
  module Validator
    describe ParentheseValidator do

      it 'should not support if no parenthesis' do
        validator = ParentheseValidator.new
        validator.subject = '0124512345'
        expect(validator.supported?).to be_falsey
      end

      it 'should not support if with only open parenthesis' do
        validator = ParentheseValidator.new
        validator.subject = '(0124512345'
        expect(validator.supported?).to be_truthy
      end

      it 'should not support if with only close parenthesis' do
        validator = ParentheseValidator.new
        validator.subject = '0124512345)'
        expect(validator.supported?).to be_truthy
      end

      it 'should be invalid if digits in paratheses > 4' do
        validator = ParentheseValidator.new
        validator.subject = '(01245)12345'
        expect {validator.validate}.to raise_error ValidationError
        validator.subject = '(012456)12345'
        expect {validator.validate}.to raise_error ValidationError
        validator.subject = '(0124567)12345'
        expect {validator.validate}.to raise_error ValidationError
      end

      it 'should be valid if digits in paratheses == 4 but > 1' do
        validator = ParentheseValidator.new
        validator.subject = '(12)12345'
        expect {validator.validate}.not_to raise_error
        validator.subject = '(123)12345'
        expect {validator.validate} .not_to raise_error
        validator.subject = '(1234)12345'
        expect {validator.validate}.not_to raise_error
      end

      it 'should be invalid if digits in paratheses < 1' do
        validator = ParentheseValidator.new
        validator.subject = '()12345'
        expect {validator.validate}.to raise_error
      end

      it 'should be invalid if digits in paratheses == 1' do
        validator = ParentheseValidator.new
        validator.subject = '(1)12345'
        expect {validator.validate}.to raise_error
      end
    end
  end
end