require 'formatter/formatter'

module Formatter
  describe Formatter::OldNumberFormatter do

    it 'should support if number starts with 025' do
      formatter = OldNumberFormatter.new
      expect(formatter.supported?('025123456')).to be_truthy
    end

    it 'should not support if number does not start with 025' do
      formatter = OldNumberFormatter.new
      expect(formatter.supported?('021123456')).to be_falsey
      expect(formatter.supported?('022123456')).to be_falsey
      expect(formatter.supported?('024123456')).to be_falsey
      expect(formatter.supported?('023123456')).to be_falsey
      expect(formatter.supported?('03123456')).to be_falsey
      expect(formatter.supported?('04123456')).to be_falsey
    end

    it 'should format 02512345 into 024712345' do
      formatter = OldNumberFormatter.new
      expect(formatter.format('02512345')).to eq '027412345'
      expect(formatter.format('0251025467')).to eq '02741025467'
    end
  end
end