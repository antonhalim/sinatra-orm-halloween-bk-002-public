require 'bundler/setup'

rack_env =  ENV['RACK_ENV'] || 'development'

Bundler.require(:default, rack_env.to_sym)
