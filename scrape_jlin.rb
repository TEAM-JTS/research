require_relative './config/environment.rb'

jlin_url = "http://espn.go.com/nba/player/_/id/4299/jeremy-lin"

scraper = PlayerScraper.new(jlin_url)
jlin_name = scraper.get_name

binding.pry