# Here goes your database connection and options:

# Here go your requires for models:
# require 'model/user'
require "sequel"
require "logger"

QUEUENINJA_DB = ENV["QUEUENINJA_DB"] unless ENV["QUEUENINJA_DB"].nil?
QUEUENINJA_DB = "sqlite://db/queueninja.db" unless Object.const_defined? "QUEUENINJA_DB"
QUEUENINJA_ENV = ENV["QUEUENINJA_ENV"] unless ENV["QUEUENINJA_ENV"].nil?
QUEUENINJA_ENV = "development" unless Object.const_defined? "QUEUENINJA_ENV"
DB = Sequel.connect(QUEUENINJA_DB, :loggers => Logger.new(File.join(File.dirname(__FILE__),"..","log","#{QUEUENINJA_ENV}.log")))
# Require all models in '/model/*.rb'
Dir[File.join(File.dirname(__FILE__), "*.rb")].each { |file| require file }
