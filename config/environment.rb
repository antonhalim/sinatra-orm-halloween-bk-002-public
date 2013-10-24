require 'bundler/setup'

ENV['RACK_ENV'] ||= 'development'
db_path = "#{Dir.pwd}/db/halloween_#{ENV['RACK_ENV']}.db"

Bundler.require(:default, ENV['RACK_ENV'].to_sym)

DB = Sequel.connect("sqlite://#{db_path}")

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}
