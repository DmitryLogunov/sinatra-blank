ENV['APP_ENV'] ||= 'development'
ENV['RACK_ENV'] ||= ENV['APP_ENV']
require 'rubygems'
require 'bundler'
require 'yaml'

Bundler.require(:default, ENV['APP_ENV'])

ROOT_PATH = File.expand_path("../../", __FILE__)

Constants = Hashie::Mash.new(YAML::load(File.open(File.join(ROOT_PATH, "config", "application.yml")))).send(ENV['APP_ENV'])


$LOAD_PATH.unshift("#{ROOT_PATH}/system")

#%w{
#}.each do |f|
#  require(f)
#end


unless ENV['APP_ENV'] == 'development'
  Raven.configure do |config|
    config.dsn = Constants.raven.dsn
  end
end

require 'app'