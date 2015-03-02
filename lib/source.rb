require 'source/version'
require 'formatter/formatter'
require 'validator/validator'
require 'logger'

module Source

  $validator_log = Logger.new('log/validator.log', 0, 100 * 1024 * 1024)
  $formatter_log = Logger.new('log/formatter.log', 0, 100 * 1024 * 1024)

  class CLI

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
        Validator.validate input
      rescue ValidationError => e
        puts e.message
        return
      end
      puts "#{input}"
    end
  end
end
