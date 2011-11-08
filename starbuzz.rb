require "rubygems"
require "sinatra"
def gen_entries
  entries = []
  entries << {name:'House Blend',price:'$1.49',description:'A smooth, mild blend of coffees from Mexico, Bolivia and Guatemala.'}
  entries << {name:'Mocha Cafe Latte',price:'$2.35',description:'Espresso, steamed milk and chocolate syrup.'}
  entries << {name:'Cappucino',price:'$1.89',description:'A mixture of espresso, steamed milk and foam.'}
  entries << {name:'Chai Tea',price:'$1.85',description:'A spicy drink made with black tea, spices, milk and honey.'}
  entries
end
get '/' do
  @foo = 'Tom Porter'
  @bar = gen_entries
  haml :index
end
