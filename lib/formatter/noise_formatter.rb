require 'source'

module Formatter

  class NoiseFormatter

    def initialize(excludes = [], next_formatter = nil)
      @next = next_formatter
      @excludes = excludes
    end

    def supported?
      true
    end

    def format(subject)
      target = subject.dup
      target = target.rstrip
      target = target.lstrip
      target = target.downcase
      unless @excludes.include? '\s'
        target = target.gsub(/\s+/, '')
      end
      unless @excludes.include? '('
        target = target.gsub(/\(+/, '')
      end
      unless @excludes.include? ')'
        target = target.gsub(/\)+/, '')
      end
      unless @excludes.include? '-'
        target = target.gsub(/(-)+/, '')
      end
      # $formatter_log.info "NoiseFormatter => Formatted : #{target}" unless target
      target
    end
  end
end