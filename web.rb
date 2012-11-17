require 'sinatra'
require 'typhoeus'
require 'nokogiri'
require 'logger'
require 'json/ext'
require_relative './rgapi.rb'
require_relative './connector.rb'
require_relative './model/songresult.rb'
require_relative './model/songlyric.rb'
require_relative './model/line.rb'
require_relative './model/phrase.rb'

get '/' do 
  api = RGAPI.new
  api.do_something
end

get '/popular' do
  puts "popular called"
  api = RGAPI.new
  api.popular_songs
end

get '/lyric/:lyriclink' do
  lyriclink = params['lyriclink']
  api = RGAPI.new
  api.fetch_lyric(lyriclink)
end

get '/search/quick/:query' do
  query = params['query']
  api = RGAPI.new
  api.quick_search(query)
end

before do
  content_type :html, 'charset' => 'utf-8'
end