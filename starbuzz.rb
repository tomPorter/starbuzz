require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'haml'


## >> Write helper/wrapper to return a given number of random
## >> lorem paragraphs.
## require 'lorem'
## n = 12 # only 12 paras avail from lorem
## x = Lorem::Base.new(:paragraphs,n).output
## paras = x.split("\n\n")
## Now have to pick random paragraphs out of the 12 returned.
## wrap para's in <p> tags

set :static, true
#set :public 
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/mydatabase.db")
Dir["#{File.dirname(__FILE__)}/models/*.rb"].each do |model| 
  require model 
  if model.include? 'drink' 
    Drink.auto_migrate! unless Drink.storage_exists?
  end
end

['/','/index','/index.html'].each do |pattern|
  get pattern do
    #@foo = 'for Tom Porter'
    @foo = ''
    @drinks = Drink.all
    haml :index
  end
end

get '/mission' do
  title = "Starbuzz Coffee Mission"
  haml :mission, :locals => {:title => title}
end

#get %r{/rb(.*)} do
get %r{/rb} do
  #"""request.fullpath #{request.fullpath}<br>
  #request.params #{request.params}<br>
  #request.query_string #{request.query_string}<br>
  #params #{params}"""
  title = "Starbuzz Coffee Really Big"
  haml :rb, :locals => {:title => title}
end
get '/:id' do
  #@foo = 'for Tom Porter'
  @foo = ''
  @id = params[:id]
  @drinks = Drink.all(:id => @id)
  if @drinks.size == 0
    haml :id_not_found
  else
    haml :index
  end
end
