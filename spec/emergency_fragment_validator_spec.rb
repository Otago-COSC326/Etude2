require 'validator/validator'
require 'source'
require 'spec_helper'

module Validator
  describe Validator::EmergencyFragmentValidator do

    describe 'supported?' do
      it 'should support if number starts with 03, 04, 06, 07, 09' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '031234567'
        expect(validator.supported?).to be_truthy

        validator.subject = '041234567'
        expect(validator.supported?).to be_truthy

        validator.subject = '061234567'
        expect(validator.supported?).to be_truthy

        validator.subject = '071234567'
        expect(validator.supported?).to be_truthy

        validator.subject = '091234567'
        expect(validator.supported?).to be_truthy

        validator.subject = '09 1234567'
        expect(validator.supported?).to be_truthy
      end

      it 'should support if number does not start with 03, 04, 06, 07, 09' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '021234567'
        expect(validator.supported?).to be_falsey

        validator.subject = '08001234567'
        expect(validator.supported?).to be_falsey

        validator.subject = '0800 1234567'
        expect(validator.supported?).to be_falsey
      end

    end

    describe 'validate' do
      it 'should be invalid if 03 is followed by 900' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '039001234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 03 is not followed by 911' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '039111234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 03 is not followed by 999' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '039991234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 04 is followed by 900' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '049001234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 04 is not followed by 911' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '049111234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 04 is not followed by 999' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '049991234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 06 is followed by 900' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '069001234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 06 is not followed by 911' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '069111234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 06 is not followed by 999' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '069991234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 07 is followed by 900' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '079001234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 07 is not followed by 911' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '079111234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 07 is not followed by 999' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '079991234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 09 is followed by 900' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '099001234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 09 is not followed by 911' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '099111234'
        expect {validator.validate}.to raise_exception ValidationError
      end

      it 'should be invalid if 09 is not followed by 999' do
        validator = EmergencyFragmentValidator.new
        validator.subject = '099991234'
        expect {validator.validate}.to raise_exception ValidationError
      end
    end
  end
end