require 'formatter/formatter'

module Formatter
  describe Formatter::LetterToNumberFormatter do

    describe 'supported?' do
      it 'should support if number starts with 0800 or (0800) and contains alphabets' do
        formatter = LetterToNumberFormatter.new
        expect(formatter.supported?('0800ABC1D34')).to be_truthy
        expect(formatter.supported?('(0800)0800ABC1D34')).to be_truthy
      end

      it 'should support if number starts with 0800 or (0800) but does not contain alphabets' do
        formatter = LetterToNumberFormatter.new
        expect(formatter.supported?('0800')).to be_falsey
        expect(formatter.supported?('(0800)1234')).to be_falsey
      end
    end

    describe 'format' do
      it 'should convert 0800 TOGOGO -> 0800864646' do
        formatter = LetterToNumberFormatter.new
        expect(formatter.format('0800 TOGOGO')).to eq '0800864646'
      end

      it 'should convert 0800 TOGOGOTT -> 0800864646' do
        formatter = LetterToNumberFormatter.new
        expect(formatter.format('0800 TOGOGOTT')).to eq '08008646468'
      end

      it 'should convert 0800 TO22GO -> 0800864646' do
        formatter = LetterToNumberFormatter.new
        expect(formatter.format('0800 TO22GO')).to eq '0800862246'
      end

      it 'should convert 0800 TO22 -> 08008622' do
        formatter = LetterToNumberFormatter.new
        expect(formatter.format('0800 TO22')).to eq '08008622'
      end

      it 'should convert (0800) GARBAGE -> 08004272243' do
        formatter = LetterToNumberFormatter.new
        expect(formatter.format('(0800) GARBAGE')).to eq '08004272243'
      end
    end
  end
end