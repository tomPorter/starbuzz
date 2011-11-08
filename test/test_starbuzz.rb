#!/usr/local/bin/ruby
require 'test/unit'
require 'rack/test'
require_relative '../starbuzz.rb'
ENV['RACK_ENV'] = 'test'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_my_default
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('Starbuzz Coffee Beverages'), "Did not find Starbuzz"
  end

  def test_foo_inclusion
    get '/'
    assert last_response.body.include?('Tom Porter'), "Did not find Tom Porter"
  end

end
