require "rubygems"
require "sinatra"
get '/' do
  @foo = 'Tom Porter'
  haml :index
end
