module PhoneValidator
  module Validator
    describe HyphenValidator do

      describe 'supported?' do
        it 'should not support if there is no hyphen' do
          validator = HyphenValidator.new
          validator.subject = '123456789'
          expect(validator.supported?).to be_falsey
        end

        it 'should support if there ishyphen' do
          validator = HyphenValidator.new
          validator.subject = '1234-56789'
          expect(validator.supported?).to be_truthy

          validator.subject = '-1234-56--789-'
          expect(validator.supported?).to be_truthy
        end
      end

      describe 'validate' do

        describe '0800' do
          it 'should be valid when number starts with 0800, 8 digits and hypen is at index 8' do
            validator = HyphenValidator.new
            validator.subject = '0800 2222-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '0800-2222-2222'
            expect {validator.validate}.to raise_exception ValidationError

            validator.subject = '0800-22222-222'
            expect {validator.validate}.to raise_exception ValidationError
          end

          it 'should be invalid when number contains letters' do
            validator = HyphenValidator.new
            validator.subject = '0800 2222-abc'
            expect {validator.validate}.to raise_exception ValidationError

            validator.subject = '0800-def-2222'
            expect {validator.validate}.to raise_exception ValidationError

            validator.subject = '0800-get-222'
            expect {validator.validate}.to raise_exception ValidationError
          end

          it 'should be valid when number starts with 0800, 7 digits and hypen is at index 7' do
            validator = HyphenValidator.new
            validator.subject = '0800 222-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '0800-222-22222'
            expect {validator.validate}.to raise_exception ValidationError
          end

          it 'should be valid when number starts with 0800, 6 digits and hypen is at index 7' do
            validator = HyphenValidator.new
            validator.subject = '0800 222-222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '0800-222-222'
            expect {validator.validate}.to raise_exception ValidationError
          end
        end

        describe '0508' do
          it 'should be valid when number starts with 0508, 6 digits and hypen is at index 7' do
            validator = HyphenValidator.new
            validator.subject = '0508 222-222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '0508-222-222'
            expect {validator.validate}.to raise_exception ValidationError
          end

          it 'should be valid when number starts with 0508, 8 digits and hypen is at index 8' do
            validator = HyphenValidator.new
            validator.subject = '0508 2222-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '0508-2222-2222'
            expect {validator.validate}.to raise_exception ValidationError
          end
        end

        describe '0900' do
          it 'should be valid when number starts with 0900, 5 digits and no hyphen' do
            validator = HyphenValidator.new
            validator.subject = '0900 22222'
            expect {validator.validate}.to raise_exception

            validator.subject = '0900-22222'
            expect {validator.validate}.to raise_exception ValidationError
          end

          it 'should be valid when number starts with 0900, 6 digits and hypen is at index 7' do
            validator = HyphenValidator.new
            validator.subject = '0900 222-222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '0900-222-222'
            expect {validator.validate}.to raise_exception ValidationError
          end

          it 'should be valid when number starts with 0900, 8 digits and hypen is at index 8' do
            validator = HyphenValidator.new
            validator.subject = '0900 2222-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '0900-2222-2222'
            expect {validator.validate}.to raise_exception ValidationError
          end
        end

        describe '022' do
          it 'should be valid when number starts with 022, 7 digits and hypen is at index 5' do
            validator = HyphenValidator.new
            validator.subject = '022 222-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '022-222-2222'
            expect {validator.validate}.to raise_exception ValidationError
          end
        end

        describe '021' do
          it 'should be valid when number starts with 021, 7 digits and hypen is at index 5' do
            validator = HyphenValidator.new
            validator.subject = '021 222-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '021-222-2222'
            expect {validator.validate}.to raise_exception ValidationError
          end

          it 'should be valid when number starts with 021, 8 digits and hypen is at index 8' do
            validator = HyphenValidator.new
            validator.subject = '021 2222-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '021-2222-2222'
            expect {validator.validate}.to raise_exception ValidationError
          end
        end

        describe '027' do
          it 'should be valid when number starts with 027, 7 digits and hypen is at index 5' do
            validator = HyphenValidator.new
            validator.subject = '027 222-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '027-222-2222'
            expect {validator.validate}.to raise_exception ValidationError
          end
        end

        describe '025' do
          it 'should be valid when number starts with 025, 7 digits and hypen is at index 5' do
            validator = HyphenValidator.new
            validator.subject = '025 222-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '025-222-2222'
            expect {validator.validate}.to raise_exception ValidationError
          end
        end

        describe '02' do
          it 'should be valid when number starts with 02, 7 digits and hypen is at index 5' do
            validator = HyphenValidator.new
            validator.subject = '02 409-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '02 323-4567'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '02-409-2222'
            expect {validator.validate}.to raise_exception ValidationError
          end
        end

        describe '03' do
          it 'should be valid when number starts with 03, 7 digits and hypen is at index 5' do
            validator = HyphenValidator.new
            validator.subject = '03 409-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '03-409-2222'
            expect {validator.validate}.to raise_exception ValidationError
          end
        end

        describe '04' do
          it 'should be valid when number starts with 04, 7 digits and hypen is at index 5' do
            validator = HyphenValidator.new
            validator.subject = '04 409-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '04-409-2222'
            expect {validator.validate}.to raise_exception ValidationError
          end
        end

        describe '07' do
          it 'should be valid when number starts with 07, 7 digits and hypen is at index 5' do
            validator = HyphenValidator.new
            validator.subject = '07 409-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '07-409-2222'
            expect {validator.validate}.to raise_exception ValidationError
          end
        end

        describe '09' do
          it 'should be valid when number starts with 09, 7 digits and hypen is at index 5' do
            validator = HyphenValidator.new
            validator.subject = '09 409-2222'
            expect {validator.validate}.not_to raise_exception

            validator.subject = '09-409-2222'
            expect {validator.validate}.to raise_exception ValidationError
          end
        end
      end

    end
  end
end