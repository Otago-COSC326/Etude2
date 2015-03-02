require 'formatter/formatter'
require 'source'

module Formatter
  describe Formatter::WhiteSpaceFormatter do

    describe 'format' do
      it 'should convert 08001234567 -> 0800 123 4567' do
        formatter = WhiteSpaceFormatter.new
        expect(formatter.format('08001234567')).to eq '0800 123 4567'
      end

      it 'should convert 08001234567 -> 0800 123 4567' do
        formatter = WhiteSpaceFormatter.new
        expect(formatter.format('08001234567')).to eq '0800 123 4567'
      end

      it 'should convert 0211234567 -> 021 123 4567' do
        formatter = WhiteSpaceFormatter.new
        expect(formatter.format('0211234567')).to eq '021 123 4567'
      end

      it 'should convert 029234567 -> 02 923 4567' do
        formatter = WhiteSpaceFormatter.new
        expect(formatter.format('029234567')).to eq '02 923 4567'
      end

      it 'should convert 039234567 -> 03 923 4567' do
        formatter = WhiteSpaceFormatter.new
        expect(formatter.format('039234567')).to eq '03 923 4567'
      end

      it 'should convert 049234567 -> 04 923 4567' do
        formatter = WhiteSpaceFormatter.new
        expect(formatter.format('049234567')).to eq '04 923 4567'
      end

      it 'should convert 069234567 -> 06 923 4567' do
        formatter = WhiteSpaceFormatter.new
        expect(formatter.format('069234567')).to eq '06 923 4567'
      end

      it 'should convert 079234567 -> 07 923 4567' do
        formatter = WhiteSpaceFormatter.new
        expect(formatter.format('079234567')).to eq '07 923 4567'
      end

      it 'should convert 099234567 -> 09 923 4567' do
        formatter = WhiteSpaceFormatter.new
        expect(formatter.format('099234567')).to eq '09 923 4567'
      end
    end
  end
end