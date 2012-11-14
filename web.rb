require 'sinatra'
require 'typhoeus'
require 'nokogiri'
require 'logger'
require_relative './rgapi.rb'
require_relative './connector.rb'

get '/' do 
  api = RGAPI.new
  api.do_something
end

get '/popular' do
  puts "popular called"
  api = RGAPI.new
  api.popular_songs
end