require 'sinatra'
require 'typhoeus'
require 'nokogiri'
require_relative './rgapi.rb'

get '/' do 
  "Hello world!"
end