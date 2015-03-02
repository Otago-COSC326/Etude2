require 'validator/validator'
require 'source'

module Validator
  describe Validator::ScottBaseValdiator do

    describe 'supported?' do
      it 'should support if number starts with 02 and not a mobile number' do
        validator = ScottBaseValdiator.new
        validator.subject = '02452345'
        expect(validator.supported?).to be_truthy

        validator.subject = '0234566'
        expect(validator.supported?).to be_truthy
      end

      it 'should not support if number starts with 02 and is a mobile number' do
        validator = ScottBaseValdiator.new
        validator.subject = '0210731561'
        expect(validator.supported?).to be_falsey

        validator.subject = '0224304233'
        expect(validator.supported?).to be_falsey

        validator.subject = '0254304233'
        expect(validator.supported?).to be_falsey

        validator.subject = '0274304233'
        expect(validator.supported?).to be_falsey
      end
    end

    describe 'validate' do
      it 'should be valid if 02 is followed by 409' do
        validator = ScottBaseValdiator.new
        validator.subject = '024091234'
        expect {validator.validate}.not_to raise_exception
      end

      it 'should be invalid if 02 is not followed by 409' do
        validator = ScottBaseValdiator.new
        validator.subject = '021234567'
        expect {validator.validate}.to raise_exception
      end
    end
  end
end