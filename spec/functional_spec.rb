require 'source'

module Source

  describe Source::CLI do

    describe 'process_input' do

      before(:each) do
        CLI.reset
      end

      describe '0508:Valid' do
        it '0508123456 -> 0508 123 456' do
          process = -> {
            CLI.process_input('0508123456')
          }
          expect(process).to  output("0508 123 456\n").to_stdout
        end

        it '0508 345678 -> 0508 345 678' do
          process = -> {
            CLI.process_input('0508 345678')
          }
          expect(process).to  output("0508 345678 INV\n").to_stdout
        end

        it '(0508)357345 -> 0508 357 345' do
          process = -> {
            CLI.process_input('(0508)357345')
          }
          expect(process).to  output("0508 357 345\n").to_stdout
        end

        it '(0508) 543678 -> (0508) 543678 INV\n' do
          process = -> {
            CLI.process_input('(0508) 543678')
          }
          expect(process).to  output("(0508) 543678 INV\n").to_stdout
        end

        it '(0508)536-345 -> 0508 536 345' do
          process = -> {
            CLI.process_input('(0508)536-345')
          }
          expect(process).to  output("0508 536 345\n").to_stdout
        end

        it '(0508) 324-542 -> 0508 324 542' do
          process = -> {
            CLI.process_input('(0508) 324-542')
          }
          expect(process).to  output("0508 324 542\n").to_stdout
        end

        it '(0508)123DEF -> 0508 123 333' do
          process = -> {
            CLI.process_input('(0508)123DEF')
          }
          expect(process).to  output("0508 123 333\n").to_stdout
        end

        it '(0508) 123ABC -> 0508 123 222' do
          process = -> {
            CLI.process_input('(0508) 123ABC')
          }
          expect(process).to  output("0508 123 222\n").to_stdout
        end
      end

      describe '0508:Invalid' do
        it '05081234567 -> 05081234567 INV' do
          process = -> {
            CLI.process_input('05081234567')
          }
          expect(process).to  output("05081234567 INV\n").to_stdout
        end

        it '(0508) 1234567 -> (0508) 1234567 INV' do
          process = -> {
            CLI.process_input('(0508) 1234567')
          }
          expect(process).to  output("(0508) 1234567 INV\n").to_stdout
        end

        it '0508 1234567 -> 0508 1234567 INV' do
          process = -> {
            CLI.process_input('0508 1234567')
          }
          expect(process).to  output("0508 1234567 INV\n").to_stdout
        end

        it '050812345 -> 050812345 INV' do
          process = -> {
            CLI.process_input('050812345')
          }
          expect(process).to  output("050812345 INV\n").to_stdout
        end

        it '(0508)12345 -> (0508)12345 INV' do
          process = -> {
            CLI.process_input('(0508)12345')
          }
          expect(process).to  output("(0508)12345 INV\n").to_stdout
        end

        it '(0508) 12345 -> (0508) 12345 INV' do
          process = -> {
            CLI.process_input('(0508) 12345')
          }
          expect(process).to  output("(0508) 12345 INV\n").to_stdout
        end

        it '(0508)-12345 -> (0508)-12345 INV' do
          process = -> {
            CLI.process_input('(0508)-12345')
          }
          expect(process).to  output("(0508)-12345 INV\n").to_stdout
        end

        it '(0508) 12-3ABC -> 0508 123 222' do
          process = -> {
            CLI.process_input('(0508) 12-3ABC')
          }
          expect(process).to  output("(0508) 12-3ABC INV\n").to_stdout
        end

      end

      describe '0508:Duplicate' do

        it '0508123456 -> 0508 123 456' do
          CLI.process_input('0508123456')
          process = -> {
            CLI.process_input('0508123456')
          }
          expect(process).to  output("0508 123 456 DUP\n").to_stdout
        end

        it '(0508)357345 -> 0508 357 345' do
          CLI.process_input('(0508)357345')
          process = -> {
            CLI.process_input('(0508)357345')
          }
          expect(process).to  output("0508 357 345 DUP\n").to_stdout
        end
      end

      describe '0800:Valid' do
        it '0800123456 -> 0800 123 456' do
          process = -> {
            CLI.process_input('0800123456')
          }
          expect(process).to  output("0800 123 456\n").to_stdout
        end

        it '08001234567 -> 0800 123 4567' do
          process = -> {
            CLI.process_input('08001234567')
          }
          expect(process).to  output("0800 123 4567\n").to_stdout
        end

        it '(0800)876234 -> 0800 876 234' do
          process = -> {
            CLI.process_input('(0800)876234')
          }
          expect(process).to  output("0800 876 234\n").to_stdout
        end

        it '(0800) 456234 -> (0800) 456234 INV\n' do
          process = -> {
            CLI.process_input('(0800) 456234')
          }
          expect(process).to  output("(0800) 456234 INV\n").to_stdout
        end

        it '(0800)1234567 -> 0800 123 4567' do
          process = -> {
            CLI.process_input('(0800)1234567')
          }
          expect(process).to  output("0800 123 4567\n").to_stdout
        end

        it '(0800) 1234567 -> (0800) 1234567 INV\n' do
          process = -> {
            CLI.process_input('(0800) 1234567')
          }
          expect(process).to  output("(0800) 1234567 INV\n").to_stdout
        end

        it '(0800) AAAAAAAAA -> 0800 222 2222' do
          process = -> {
            CLI.process_input('(0800) AAAAAAAAA')
          }
          expect(process).to  output("0800 222 2222\n").to_stdout
        end

        it '(0800) 123-456 -> 0800 123 456' do
          process = -> {
            CLI.process_input('(0800) 123-456')
          }
          expect(process).to  output("0800 123 456\n").to_stdout
        end

        it '(0800) 123-4567 -> 0800 123 4567' do
          process = -> {
            CLI.process_input('(0800) 123-4567')
          }
          expect(process).to  output("0800 123 4567\n").to_stdout
        end

      end

      describe '0800:Duplicate' do
        it '0800123456 -> 0800 123 456' do
          CLI.process_input('0800123456')
          process = -> {
            CLI.process_input('0800123456')
          }
          expect(process).to  output("0800 123 456 DUP\n").to_stdout
        end

        it '08001234567 -> 0800 123 4567' do
          CLI.process_input('08001234567')
          process = -> {
            CLI.process_input('08001234567')
          }
          expect(process).to  output("0800 123 4567 DUP\n").to_stdout
        end

        it '(0800)876234 -> 0800 876 234' do
          CLI.process_input('(0800)876234')
          process = -> {
            CLI.process_input('(0800)876234')
          }
          expect(process).to  output("0800 876 234 DUP\n").to_stdout
        end

        it '(0800)1234567 -> 0800 123 4567' do
          CLI.process_input('(0800)1234567')
          process = -> {
            CLI.process_input('(0800)1234567')
          }
          expect(process).to  output("0800 123 4567 DUP\n").to_stdout
        end

        it '(0800) AAAAAAAAA -> 0800 222 2222' do
          CLI.process_input('(0800) AAAAAAAAA')
          process = -> {
            CLI.process_input('(0800) AAAAAAAAA')
          }
          expect(process).to  output("0800 222 2222 DUP\n").to_stdout
        end

        it '(0800) 123-456 -> 0800 123 456' do
          CLI.process_input('(0800) 123-456')
          process = -> {
            CLI.process_input('(0800) 123-456')
          }
          expect(process).to  output("0800 123 456 DUP\n").to_stdout
        end

        it '(0800) 123-4567 -> 0800 123 4567' do
          CLI.process_input('(0800) 123-4567')
          process = -> {
            CLI.process_input('(0800) 123-4567')
          }
          expect(process).to  output("0800 123 4567 DUP\n").to_stdout
        end

      end

      describe '0800:Invalid' do
        it '080012345 -> 080012345 INV' do
          process = -> {
            CLI.process_input('080012345 ->')
          }
          expect(process).to  output("080012345 -> INV\n").to_stdout
        end

        it '080012345678 -> 080012345678 INV' do
          process = -> {
            CLI.process_input('080012345678 ->')
          }
          expect(process).to  output("080012345678 -> INV\n").to_stdout
        end

        it '(0800) AAAAAAAAAAA -> (0800) AAAAAAAAAAA INV' do
          process = -> {
            CLI.process_input('(0800) AAAAAAAAAAA')
          }
          expect(process).to  output("(0800) AAAAAAAAAAA INV\n").to_stdout
        end

        it '(0800)-123-4567 -> (0800)-123-4567 INV' do
          process = -> {
            CLI.process_input('(0800)-123-4567')
          }
          expect(process).to  output("(0800)-123-4567 INV\n").to_stdout
        end

        it '(0800) 12-3ABC -> (0800) 12-3ABC INV' do
          process = -> {
            CLI.process_input('(0800) 12-3ABC')
          }
          expect(process).to  output("(0800) 12-3ABC INV\n").to_stdout
        end
      end

      describe '0900:Valid' do
        it '090012345 -> 0900 12345' do
          process = -> {
            CLI.process_input('090012345')
          }
          expect(process).to  output("0900 12345\n").to_stdout
        end

        it '0900 12345 -> 0900 12345' do
          process = -> {
            CLI.process_input('0900 12345')
          }
          expect(process).to  output("0900 12345\n").to_stdout
        end

        it '(0900)12345 -> 0900 12345' do
          process = -> {
            CLI.process_input('(0900)12345')
          }
          expect(process).to  output("0900 12345\n").to_stdout
        end

        it '(0900) 12345 -> 0900 12345' do
          process = -> {
            CLI.process_input('(0900) 12345')
          }
          expect(process).to  output("0900 12345\n").to_stdout
        end
      end

      describe '0900:Duplicate' do
        it '090012345 -> 0900 12345' do
          CLI.process_input('090012345')
          process = -> {
            CLI.process_input('090012345')
          }
          expect(process).to  output("0900 12345 DUP\n").to_stdout
        end

        it '0900 12345 -> 0900 12345' do
          CLI.process_input('0900 12345')
          process = -> {
            CLI.process_input('0900 12345')
          }
          expect(process).to  output("0900 12345 DUP\n").to_stdout
        end

        it '(0900)12345 -> 0900 12345' do
          CLI.process_input('(0900)12345')
          process = -> {
            CLI.process_input('(0900)12345')
          }
          expect(process).to  output("0900 12345 DUP\n").to_stdout
        end

        it '(0900) 12345 -> 0900 12345' do
          CLI.process_input('(0900) 12345')
          process = -> {
            CLI.process_input('(0900) 12345')
          }
          expect(process).to  output("0900 12345 DUP\n").to_stdout
        end
      end

      describe '0900:Invalid' do
        it '09001234 -> 09001234 INV' do
          process = -> {
            CLI.process_input('09001234')
          }
          expect(process).to  output("09001234 INV\n").to_stdout
        end

        it '0900123456 -> 0900123456 INV' do
          process = -> {
            CLI.process_input('0900123456')
          }
          expect(process).to  output("0900123456 INV\n").to_stdout
        end

        it '0900123-45 -> 0900123-45 INV' do
          process = -> {
            CLI.process_input('0900123-45')
          }
          expect(process).to  output("0900123-45 INV\n").to_stdout
        end

        it '0900-123-45 -> 0900-123-45 INV' do
          process = -> {
            CLI.process_input('0900-123-45')
          }
          expect(process).to  output("0900-123-45 INV\n").to_stdout
        end
      end

      describe '02:Valid' do
        it '024091234 -> 02 409 1234' do
          process = -> {
            CLI.process_input('024091234')
          }
          expect(process).to  output("02 409 1234\n").to_stdout
        end

        it '02 4091234 -> 02 4091234 INV\n' do
          process = -> {
            CLI.process_input('02 4091234')
          }
          expect(process).to  output("02 4091234 INV\n").to_stdout
        end

        it '02 409 1234 -> 02 409 1234' do
          process = -> {
            CLI.process_input('02 409 1234')
          }
          expect(process).to  output("02 409 1234\n").to_stdout
        end

        it '02 409-1234 -> 02 409 1234' do
          process = -> {
            CLI.process_input('02 409-1234')
          }
          expect(process).to  output("02 409 1234\n").to_stdout
        end
      end

      describe '02:Duplicate' do
        it '024091234 -> 02 409 1234' do
          CLI.process_input('024091234')
          process = -> {
            CLI.process_input('024091234')
          }
          expect(process).to  output("02 409 1234 DUP\n").to_stdout
        end

        it '02 409 1234 -> 02 409 1234' do
          CLI.process_input('02 409 1234')
          process = -> {
            CLI.process_input('02 409 1234')
          }
          expect(process).to  output("02 409 1234 DUP\n").to_stdout
        end

        it '02 409-1234 -> 02 409 1234' do
          CLI.process_input('02 409-1234')
          process = -> {
            CLI.process_input('02 409-1234')
          }
          expect(process).to  output("02 409 1234 DUP\n").to_stdout
        end
      end

      describe '02:Invalid' do
        it '02345678 -> 02345678 INV' do
          process = -> {
            CLI.process_input('02345678')
          }
          expect(process).to  output("02345678 INV\n").to_stdout
        end

        it '02 345 678 -> 02 345 678 INV' do
          process = -> {
            CLI.process_input('02 345 678')
          }
          expect(process).to  output("02 345 678 INV\n").to_stdout
        end

        it '023456789 -> 023456789 INV' do
          process = -> {
            CLI.process_input('023456789')
          }
          expect(process).to  output("023456789 INV\n").to_stdout
        end

        it '02 345 6789 -> 02 345 678 INV' do
          process = -> {
            CLI.process_input('02 345 6789')
          }
          expect(process).to  output("02 345 6789 INV\n").to_stdout
        end

        it '0240912345 -> 0240912345 INV' do
          process = -> {
            CLI.process_input('0240912345')
          }
          expect(process).to  output("0240912345 INV\n").to_stdout
        end
      end

      it '033234567 -> 03 323 4567' do
        process = -> {
          CLI.process_input('033234567')
        }
        expect(process).to  output("03 323 4567\n").to_stdout
      end

      it '043234567 -> 04 323 4567' do
        process = -> {
          CLI.process_input('043234567')
        }
        expect(process).to  output("04 323 4567\n").to_stdout
      end

      it '063234567 -> 06 323 4567' do
        process = -> {
          CLI.process_input('063234567')
        }
        expect(process).to  output("06 323 4567\n").to_stdout
      end

      it '073234567 -> 07 323 4567' do
        process = -> {
          CLI.process_input('073234567')
        }
        expect(process).to  output("07 323 4567\n").to_stdout
      end

      it '093234567 -> 09 323 4567' do
        process = -> {
          CLI.process_input('093234567')
        }
        expect(process).to  output("09 323 4567\n").to_stdout
      end

      it '021123456 -> 021 123 456' do
        process = -> {
          CLI.process_input('021123456')
        }
        expect(process).to  output("021 123 456\n").to_stdout
      end

      it '0211234567 -> 021 123 4567' do
        process = -> {
          CLI.process_input('0211234567')
        }
        expect(process).to  output("021 123 4567\n").to_stdout
      end

      it '02112345678 -> 021 1234 5678' do
        process = -> {
          CLI.process_input('02112345678')
        }
        expect(process).to  output("021 1234 5678\n").to_stdout
      end

      it '0221234567 -> 022 123 4567' do
        process = -> {
          CLI.process_input('0221234567')
        }
        expect(process).to  output("022 123 4567\n").to_stdout
      end

      it '0271234567 -> 027 123 4567' do
        process = -> {
          CLI.process_input('0271234567')
        }
        expect(process).to  output("027 123 4567\n").to_stdout
      end

      it '025123456 -> 027 412 3456' do
        process = -> {
          CLI.process_input('025123456')
        }
        expect(process).to  output("027 412 3456\n").to_stdout
      end
    end

  end
end