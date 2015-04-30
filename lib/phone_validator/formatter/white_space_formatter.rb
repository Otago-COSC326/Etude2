module PhoneValidator
  module Formatter
    class WhiteSpaceFormatter

      def initialize( next_formatter = nil)
        @next = next_formatter
      end

      def supported?(subject)
        true
      end

      def format(subject)
        target = subject.dup
        target = NoiseFormatter.new.format target
        result = target
        if target.match(/^(0800|0900|0508)/)
          result = target.insert 4, ' '
          if [6, 7].include?(target.length - 5)
            result = target.insert 8, ' '
          end
        elsif target.match(/^(02(?!1|2|5|7))/) || target.match(/^(03|04|06|07|09)/)
          result = target.insert 2, ' '
          if target.length - 3 == 7
            result = target.insert 6, ' '
          end
        elsif target.match(/^(021|022|025|027)/)
          result = target.insert 3, ' '
          if target.length - 4 == 6
            result = target.insert 7, ' '
          elsif target.length - 4 == 7
            result = target.insert 7, ' '
          elsif target.length - 4 == 8
            result = target.insert 8, ' '
          end
        end
        result
      end
    end
  end
end