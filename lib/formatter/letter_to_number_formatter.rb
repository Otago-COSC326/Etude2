require 'source'

module Formatter

  class LetterToNumberFormatter

    LETTERS = {
        a: 2, b: 2, c: 2,
        d: 3, e: 3, f: 3,
        g: 4, h: 4, i: 4,
        j: 5, k: 5, l: 5,
        m: 6, n: 6, o: 6,
        p: 7, q: 7, r: 7, s: 7,
        t: 8, u: 8, v: 8,
        w: 9, x: 9, y: 9, z: 9
    }

    def initialize( next_formatter = nil)
      @next = next_formatter
    end

    def supported?(subject)
      target = subject.split(/^(\(*)(0800|0508|0900)(\)*)/)[4]
      supported = !(target =~ /[a-zA-Z]+/).nil?
      $formatter_log.info "LetterValidator => not supported : #{subject}" unless supported
      supported
    end

    def format(subject)
      target = Formatter::NoiseFormatter.new.format subject
      workon = target.dup
      target.each_char.with_index do |c, i|
        stop_at = 12
        if target.start_with?('0800')
          stop_at = 11
        elsif target.start_with?('0508')
          stop_at = 10
        elsif target.start_with?('0900')
          stop_at = 9
        end
        if LETTERS.include? c.to_sym
          if i >= stop_at
            workon.sub!(c, '')
          elsif
            workon.sub!(c, LETTERS[c.to_sym].to_s)
          end
        end
      end
      $formatter_log.info "LetterValidator => Formatted : #{workon}" unless workon
      workon
    end
  end
end