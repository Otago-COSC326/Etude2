puts Dir[File.expand_path('../lib/**/*.rb', File.dirname(__FILE__))]
Dir[File.expand_path('../**/*.rb', File.dirname(__FILE__))].each {|file| require file }