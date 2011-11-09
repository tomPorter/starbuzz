require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'haml'
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/mydatabase.db")
Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |model| require model }
# automatically create the Drink table
Drink.auto_migrate! unless Drink.storage_exists?

get '/' do
  #@foo = 'for Tom Porter'
  @foo = ''
  @drinks = Drink.all
  haml :index
end
