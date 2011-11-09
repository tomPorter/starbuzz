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

  def test_header
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('Starbuzz Coffee Beverages'), "Did not find Starbuzz"
  end

  def test_entries
    get '/'
    assert last_response.ok?,'Could not fetch "/"'
    ['House Blend','Mocha Cafe Latte','Cappucino','Chai Tea'].each do |name|
      assert last_response.body.include?(name), "Did not find #{name}"
    end  
  end

  def test_by_id
    get '/1'
    assert last_response.ok?, 'Cound not fetch "/1"'
    name = 'House Blend'
    assert last_response.body.include?(name), "Did not find #{name}"
    bad_name = 'Cappucino'
    assert !last_response.body.include?(bad_name), "Found #{bad_name}"
  end

  def test_id_not_found
    get '/5'
    assert last_response.ok?, 'Cound not fetch "/5"'
    assert last_response.body.include?("Could not find drink entry"), "NO Missing ID page."
  end

end
