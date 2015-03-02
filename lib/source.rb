require 'source/version'
require 'formatter/formatter'
require 'validator/validator'
require 'logger'
require 'set'

module Source

  $validator_log = Logger.new('log/validator.log', 0, 100 * 1024 * 1024)
  $formatter_log = Logger.new('log/formatter.log', 0, 100 * 1024 * 1024)

  class CLI

    @number_store = Set.new

    def self.start
      begin
        $stdin.each_line do |line|
          process_input line.chomp
        end
      rescue SystemExit, Interrupt
        puts
      end
    end

    def self.process_input(input)
      begin
        unless input.empty?
          Validator.validate input
          input = Formatter.format input
        end
      rescue ValidationError => e
        puts e.message
        return
      end
      unless input.empty?
        if @number_store.include? input
          puts "#{input} DUP"
        else
          @number_store.add input
          puts "#{input}"
        end
      end
    end
  end
end
