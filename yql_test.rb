require 'pry'
require 'net/http'
require 'oj'


url = 'http://query.yahooapis.com/v1/public/yql?q=desc%20fantasysports.players.stats&format=json&diagnostics=true&callback='
resp = Net::HTTP.get_response(URI.parse(url)) # get_response takes an URI object

data = resp.body
hash = Oj.load(data)
binding.pry