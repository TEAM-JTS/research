require 'pry'
require 'net/http'
require 'oj'
require 'yahoo_nba'
require 'awesome_print'

url = 'http://query.yahooapis.com/v1/public/yql?q=desc%20fantasysports.players.stats&format=json&diagnostics=true&callback='
query = YahooNba::Query.new ENV['YAHOO_OAUTH_KEY'], ENV['YAHOO_OAUTH_SECRET']

player_keys_hash = query.get_all_player_keys_hash

player_keys_hash.each do |player, id|
  puts "First name: #{player.split(" ").first} / Last name: #{player.split(" ").last}"
end