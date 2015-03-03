require 'validator/validator'
require 'source'

module Validator
  describe Validator::LowercaseValidator do

    describe 'supported?' do
      it 'should support if number contains alphabets' do
        validator = LowercaseValidator.new
        validator.subject = '0800 123AAA'
        expect(validator.supported?).to be_truthy

        validator.subject = '0800 12b3AAA'
        expect(validator.supported?).to be_truthy
      end

      it 'should not support if number does not contain alphabets' do
        validator = LowercaseValidator.new
        validator.subject = '0800 123 4567'
        expect(validator.supported?).to be_falsey
      end
    end

    describe 'validate' do
       it 'should be valid when all alphabets is in Uppercase' do
         validator = LowercaseValidator.new
         validator.subject = '0800 AAA AAA'
         expect{validator.validate}.not_to raise_exception
       end

       it 'should be valid when all alphabets is in Uppercase' do
         validator = LowercaseValidator.new
         validator.subject = '0800 aaa AAA'
         expect{validator.validate}.to raise_exception ValidationError
       end
    end
  end
end