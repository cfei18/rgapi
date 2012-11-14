require 'sinatra'
require 'typhoeus'
require 'nokogiri'
require_relative './rgapi.rb'
require_relative './connector.rb'

get '/' do 
  "Hello world!"
  api = RGAPI.new
  api.do_something
end