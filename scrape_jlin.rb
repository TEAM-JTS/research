require_relative './config/environment.rb'

jlin_url = "http://espn.go.com/nba/player/_/id/4299/jeremy-lin"

player_scraper = PlayerScraper.new(jlin_url)
jlin_name = player_scraper.get_name

twitter_handle_scraper = TwitterHandleScraper.new("http://hoopeduponline.com/2009/03/30/a-list-of-every-nba-player-on-twitter/")
twitter_handle_scraper.get_name_handle_pair


binding.pry