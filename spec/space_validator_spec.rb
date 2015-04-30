module PhoneValidator
  module Validator
    describe SpaceValidator do

      describe 'supported?' do
        it 'should not support if there is hypen in the string' do
          validator = SpaceValidator.new
          validator.subject = '0800 123-456'
          expect(validator.supported?).to be_falsey
        end

        it 'should support if there is no hypen in the string but contains spaces' do
          validator = SpaceValidator.new
          validator.subject = '0800 123 456'
          expect(validator.supported?).to be_truthy
        end

        it 'should not support if there is no space in the string' do
          validator = SpaceValidator.new
          validator.subject = '0800123456'
          expect(validator.supported?).to be_falsey
        end

        it 'should not support if there is alphabets in the string' do
          validator = SpaceValidator.new
          validator.subject = '0800 RUBBISH'
          expect(validator.supported?).to be_falsey
        end
      end

      describe 'validate' do
        it 'should be valid when number is 0800 123 456' do
          validator = SpaceValidator.new
          validator.subject = '0800 123 456'
          expect{validator.validate}.not_to raise_exception
        end

        it 'should be invalid when number is 0800123 456' do
          validator = SpaceValidator.new
          validator.subject = '0800123 456'
          expect{validator.validate}.to raise_error ValidationError
        end

        it 'should be invalid when number is 0800 12 3456' do
          validator = SpaceValidator.new
          validator.subject = '0800 12 3456'
          expect{validator.validate}.to raise_error ValidationError
        end

        it 'should be valid when number is 0800 123 4567' do
          validator = SpaceValidator.new
          validator.subject = '0800 123 4567'
          expect{validator.validate}.not_to raise_error
        end

        it 'should be invalid when number is 0800123 4567' do
          validator = SpaceValidator.new
          validator.subject = '0800123 4567'
          expect{validator.validate}.to raise_error ValidationError
        end

        it 'should be invalid when number starts with 0900 and have 2 spaces' do
          validator = SpaceValidator.new
          validator.subject = '0900 145 67'
          expect{validator.validate}.to raise_error ValidationError
        end

        it 'should be valid when number is 021 123 456' do
          validator = SpaceValidator.new
          validator.subject = '021 123 456'
          expect{validator.validate}.not_to raise_error
        end

        it 'should be valid when number is 021 123 4567' do
          validator = SpaceValidator.new
          validator.subject = '021 123 4567'
          expect{validator.validate}.not_to raise_error
        end

        it 'should be valid when number is 021 1234 5678' do
          validator = SpaceValidator.new
          validator.subject = '021 1234 5678'
          expect{validator.validate}.not_to raise_error
        end

        it 'should be valid when number is 021123 456' do
          validator = SpaceValidator.new
          validator.subject = '021123 456'
          expect{validator.validate}.to raise_error ValidationError
        end

        it 'should be valid when number is 021123 4567' do
          validator = SpaceValidator.new
          validator.subject = '021123 4567'
          expect{validator.validate}.to raise_error ValidationError
        end

        it 'should be valid when number is 0211234 5678' do
          validator = SpaceValidator.new
          validator.subject = '0211234 5678'
          expect{validator.validate}.to raise_error ValidationError
        end

        it 'should be valid when number is 02 345 6789' do
          validator = SpaceValidator.new
          validator.subject = '02 345 6789'
          expect{validator.validate}.not_to raise_error
        end

        it 'should be valid when number is 02345 6789' do
          validator = SpaceValidator.new
          validator.subject = '02345 6789'
          expect{validator.validate}.to raise_error ValidationError
        end
      end
    end
  end
end