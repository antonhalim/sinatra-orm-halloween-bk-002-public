require 'bundler/setup'

rack_env =  ENV['RACK_ENV'] || 'development'

Bundler.require(:default, rack_env.to_sym)

DataMapper.setup(:default, "sqlite://../db/halloween_#{rack_env}.db")

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}
