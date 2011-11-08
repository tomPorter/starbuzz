require "rubygems"
require "sinatra"
get '/' do
  @foo = 'Starbuzz Coffee Beverages for Tom Porter'
  haml :index
end
