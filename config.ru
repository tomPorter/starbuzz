$:.unshift File.expand_path('.')
require 'starbuzz'
run Sinatra::Application
