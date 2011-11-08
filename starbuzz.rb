require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'haml'
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/mydatabase.db")
Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |model| require model }
# automatically create the Drink table
Drink.auto_migrate! unless Drink.storage_exists?

def gen_entries
  entries = []
  entries << {name:'House Blend',price:'$1.49',description:'A smooth, mild blend of coffees from Mexico, Bolivia and Guatemala.'}
  entries << {name:'Mocha Cafe Latte',price:'$2.35',description:'Espresso, steamed milk and chocolate syrup.'}
  entries << {name:'Cappucino',price:'$1.89',description:'A mixture of espresso, steamed milk and foam.'}
  entries << {name:'Chai Tea',price:'$1.85',description:'A spicy drink made with black tea, spices, milk and honey.'}
  entries
end
get '/' do
  #@foo = 'for Tom Porter'
  @foo = ''
  #@drinks = Drink.get(:order => [ :id ], :limit => 20)
  @drinks = Drink.all
  haml :index
end
