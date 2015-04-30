require 'set'
Dir[File.dirname(__FILE__) + '/**/*.rb'].each {|file| require file }

module PhoneValidator
  class CLI

    def self.reset
      @number_store = Set.new
    end

    @number_store = Set.new

    def self.start
      reset
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
          PhoneValidator::Validator.validate input
          input = PhoneValidator::Formatter.format input
        end
      rescue PhoneValidator::Validator::ValidationError => e
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
