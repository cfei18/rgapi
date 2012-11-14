require 'sinatra'
require 'typhoeus'
require 'nokogiri'
require_relative './rgapi.rb'
require_relative './connector.rb'

get '/' do 
  api = RGAPI.new
  api.do_something
end

get '/popular' do
  api = RGAPI.new
  api.popular_songs
end